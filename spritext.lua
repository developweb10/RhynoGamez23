module(..., package.seeall)
 
local movMFloor = math.floor  -- added by M.Hartlef June 12th, 2010
local movMCeil = math.ceil  -- added by M.Hartlef June 12th, 2010
 
 
function newAnim(sheetImage, frameWidth, frameHeight, startFrame, frameCount)
        require "sprite"
        
        -- setup sprites
        local g = display.newGroup()
        local sheet = sprite.newSpriteSheet(sheetImage, frameWidth, frameHeight)
        local set = sprite.newSpriteSet(sheet, startFrame, frameCount)  
        sprite.add(set, sheetImage, startFrame, frameCount, 500, 0)
        local gg = sprite.newSprite(set)
        
        gg:prepare(sheetImage)
        g:insert(gg, true)
 
        ------------------
        -- private members
        local animLabels = {}
        local limitX, limitY, transpose
        local startX, startY
        
        local totalFrames = frameCount
        local currentFrame = 1
        local startFrame = 1
        local endFrame = frameCount
        local loop = 0
        local loopCount = 0
        local remove = false
        local isDragging = false
        local dragBounds = nil
        local dragLeft, dragTop, dragWidth, dragHeight
        
        local animSpeed = 0  -- added by M.Hartlef June 12th, 2010
        local animTime = 1.0  -- added by M.Hartlef June 12th, 2010
        
        -- flag to distinguish initial default case (where no sequence parameters are submitted)
        local inSequence = false
        
        local function resetDefaults()
                currentFrame = 1
                gg.currentFrame = currentFrame
                startFrame = 1
                animTime = 1.0  -- added by M.Hartlef June 12th, 2010
                endFrame = totalFrames
                loop = 0
                loopCount = 0
                remove = false
        end
        
        local function resetReverseDefaults()
                currentFrame = totalFrames
                startFrame = totalFrames
                animTime = totalFrames  -- added by M.Hartlef June 12th, 2010
                endFrame = 1
                loop = 0
                loopCount = 0
                remove = false
        end
		local function setSpeed(time_value)
		animSpeed=time_value;
		end
		
		function g:removeSprite()
			self.parent:remove(self);
		end
        
        local function nextFrame( self, event )
                animTime = animTime + animSpeed  -- added by M.Hartlef June 12th, 2010
                currentFrame = movMFloor(animTime)  -- added by M.Hartlef June 12th, 2010
                
                if (currentFrame == endFrame + 1) then
                        if (loop > 0) then
                                loopCount = loopCount + 1
 
                                if (loopCount == loop) then
                                        -- stop looping
                                        currentFrame = currentFrame - 1
                                        animTime = currentFrame  -- added by M.Hartlef June 12th, 2010
                                        gg.currentFrame = currentFrame
                                        Runtime:removeEventListener( "enterFrame", self )
 
                                        if (remove) then
                                                -- delete self (only gets garbage collected if there are no other references)
                                                self.parent:remove(self)
                                        end
 
                                else
                                        currentFrame = startFrame
                                        animTime = startFrame  -- added by M.Hartlef June 12th, 2010
                                        gg.currentFrame = currentFrame
                                end
 
                        else
                                currentFrame = startFrame
                                animTime = startFrame  -- added by M.Hartlef June 12th, 2010
                                gg.currentFrame = currentFrame
                        end
                        
                elseif (currentFrame > totalFrames) then
                        currentFrame = 1
                        animTime = 1.0  -- added by M.Hartlef June 12th, 2010
                        gg.currentFrame = currentFrame
                else
                        gg.currentFrame = currentFrame
                end
        end
        
        local function prevFrame( self, event )
                animTime = animTime - animSpeed  -- added by M.Hartlef June 12th, 2010
                currentFrame = movMCeil(animTime)  -- added by M.Hartlef June 12th, 2010
                
                if (currentFrame == endFrame - 1) then
                        if (loop > 0) then
                                loopCount = loopCount + 1
 
                                if (loopCount == loop) then 
                                        -- stop looping
                                        currentFrame = currentFrame + 1
                                        animTime = currentFrame  -- added by M.Hartlef June 12th, 2010
                                        gg.currentFrame = currentFrame
                                        Runtime:removeEventListener( "enterFrame", self )
 
                                        if (remove) then
                                                -- delete self
                                                self.parent:remove(self)
                                        end
 
                                else
                                        currentFrame = startFrame
                                        animTime = startFrame  -- added by M.Hartlef June 12th, 2010
                                        gg.currentFrame = currentFrame
                                end
 
                        else
                                currentFrame = startFrame
                                animTime = startFrame  -- added by M.Hartlef June 12th, 2010
                                gg.currentFrame = currentFrame
                        end
                        
                elseif (currentFrame < 1) then
                        currentFrame = totalFrames
                        animTime = totalFrames  -- added by M.Hartlef June 12th, 2010
                        gg.currentFrame = currentFrame
                        
                else
                        gg.currentFrame = currentFrame
                        
                end
        end
        
        local function dragMe(self, event)
                local onPress = self._onPress
                local onDrag = self._onDrag
                local onRelease = self._onRelease
        
                if event.phase == "began" then
                        isDragging = true
                        display.getCurrentStage():setFocus( self )
                        startX = g.x
                        startY = g.y
                        
                        if onPress then
                                result = onPress( event )
                        end
                        
                elseif event.phase == "moved" and isDragging then
        
                        if transpose == true then
                                -- Note: "transpose" is deprecated now that Corona supports native landscape mode
                                -- dragBounds is omitted in transposed mode, but feel free to implement it
                                if limitX ~= true then
                                        g.x = startX - (event.yStart - event.y)
                                end
                                if limitY ~= true then
                                        g.y = startY + (event.xStart - event.x)
                                end
                        else
                                if limitX ~= true then
                                        g.x = startX - (event.xStart - event.x)
                                        if (dragBounds) then
                                                if (g.x < dragLeft) then g.x = dragLeft end
                                                if (g.x > dragLeft + dragWidth) then g.x = dragLeft + dragWidth end
                                        end
                                end
                                if limitY ~= true then
                                        g.y = startY - (event.yStart - event.y)
                                        if (dragBounds) then
                                                if (g.y < dragTop) then g.y = dragTop end
                                                if (g.y > dragTop + dragHeight) then g.y = dragTop + dragHeight end
                                        end
                                end
                        end
 
                        if onDrag then
                                result = onDrag( event )
                        end
                                
                elseif event.phase == "ended" and isDragging then
                        isDragging = false
                        display.getCurrentStage():setFocus( nil )
 
                        if onRelease then
                                result = onRelease( event )
                        end
                        
                end
                
                -- stop touch from falling through to objects underneath
                return true
        end
        
        ------------------------
        -- Define public methods
 
        function g:setSpeed(s)  -- added by M.Hartlef June 12th, 2010
                animSpeed = s
        end
 
        function g:enterFrame( event )
                self:repeatFunction( event )
        end
 
        function g:play( params )
                Runtime:removeEventListener( "enterFrame", self )
 
                if ( params ) then
                        -- if any parameters are submitted, assume this is a new sequence and reset all default values
                        resetDefaults()                  
                        inSequence = true
                        -- apply optional parameters (with some boundary and type checking)
                        --if ( params.startFrame and type(params.startFrame) == "number" ) then startFrame=params.startFrame end  -- removed by M.Hartlef June 12th, 2010
                        if ( params.startFrame and type(params.startFrame) == "number" ) then 
                                startFrame=params.startFrame
                                animTime = startFrame  -- added by M.Hartlef June 12th, 2010
                        end
                        if ( startFrame > totalFrames or startFrame < 1 ) then startFrame = 1 end
                
                        if ( params.endFrame and type(params.endFrame) == "number" ) then endFrame=params.endFrame end
                        if ( endFrame > totalFrames or endFrame < 1 ) then endFrame = totalFrames end
                
                        if ( params.loop and type(params.loop) == "number" ) then loop=params.loop end
                        if ( loop < 0 ) then loop = 0 end
                        
                        if ( params.remove and type(params.remove) == "boolean" ) then remove=params.remove end
                        loopCount = 0
                else
                        if (not inSequence) then
                                -- use default values
                                startFrame = 1
                                animTime = startFrame  -- added by M.Hartlef June 12th, 2010
                                endFrame = totalFrames
                                loop = 0
                                loopCount = 0
                                remove = false
                        end                  
                end
                
                currentFrame = startFrame
                gg.currentFrame = currentFrame
                
                self.repeatFunction = nextFrame
                Runtime:addEventListener( "enterFrame", self )
        end
        
        function g:reverse( params )
                Runtime:removeEventListener( "enterFrame", self )
                
                if ( params ) then
                        -- if any parameters are submitted, assume this is a new sequence and reset all default values
                        resetReverseDefaults()
                        inSequence = true
                        -- apply optional parameters (with some boundary and type checking)
                        --if ( params.startFrame and type(params.startFrame) == "number" ) then startFrame=params.startFrame end -- removed by M.Hartlef June 12th, 2010
                        if ( params.startFrame and type(params.startFrame) == "number" ) then 
                                startFrame=params.startFrame
                                animTime = startFrame  -- added by M.Hartlef June 12th, 2010
                        end
                        if ( startFrame > totalFrames or startFrame < 1 ) then startFrame = totalFrames end
                
                        if ( params.endFrame and type(params.endFrame) == "number" ) then endFrame=params.endFrame end
                        if ( endFrame > totalFrames or endFrame < 1 ) then endFrame = 1 end
                
                        if ( params.loop and type(params.loop) == "number" ) then loop=params.loop end
                        if ( loop < 0 ) then loop = 0 end
                
                        if ( params.remove and type(params.remove) == "boolean" ) then remove=params.remove end
                else
                        if (not inSequence) then
                                -- use default values
                                startFrame = totalFrames
                                animTime = startFrame  -- added by M.Hartlef June 12th, 2010
                                endFrame = 1
                                loop = 0
                                loopCount = 0
                                remove = false
                        end
                end
                
                currentFrame = startFrame
                gg.currentFrame = currentFrame
                
                self.repeatFunction = prevFrame
                Runtime:addEventListener( "enterFrame", self )
        end
        
        function g:nextFrame()
                -- stop current sequence, if any, and reset to defaults
                Runtime:removeEventListener( "enterFrame", self )
                inSequence = false
                
                currentFrame = currentFrame + 1
                if ( currentFrame > totalFrames ) then
                        currentFrame = 1
                end
                gg.currentFrame = currentFrame
        end
        
        
        function g:previousFrame()
                -- stop current sequence, if any, and reset to defaults
                Runtime:removeEventListener( "enterFrame", self )
                inSequence = false
                
                currentFrame = currentFrame - 1
                if ( currentFrame < 1 ) then
                        currentFrame = totalFrames
                end
                gg.currentFrame = currentFrame
        end
        
        function g:currentFrame()
                return currentFrame
        end
        
        function g:isDragging()
                return isDragging
        end
        
        function g:totalFrames()
                return totalFrames
        end
        
        function g:stop()
                Runtime:removeEventListener( "enterFrame", self )
        end
 
        function g:stopAtFrame(label)
                -- This works for either numerical indices or optional text labels
                if (type(label) == "number") then
                        Runtime:removeEventListener( "enterFrame", self )
                        currentFrame = label
                        gg.currentFrame = currentFrame
                        
                elseif (type(label) == "string") then
                        for k, v in next, animLabels do
                                if (v == label) then
                                        Runtime:removeEventListener( "enterFrame", self )
                                        currentFrame = k
                                        gg.currentFrame = currentFrame
                                end
                        end
                end
        end
 
        
        function g:playAtFrame(label)
                -- This works for either numerical indices or optional text labels
                if (type(label) == "number") then
                        Runtime:removeEventListener( "enterFrame", self )
                        currentFrame = label
                        gg.currentFrame = currentFrame
                        
                elseif (type(label) == "string") then
                        for k, v in next, animLabels do
                                if (v == label) then
                                        Runtime:removeEventListener( "enterFrame", self )
                                        currentFrame = k
                                        gg.currentFrame = currentFrame
                                end
                        end
                end
                self.repeatFunction = nextFrame
                Runtime:addEventListener( "enterFrame", self )
        end
 
 
        function g:setDrag( params )
                if ( params ) then
                        if params.drag == true then
                                limitX = (params.limitX == true)
                                limitY = (params.limitY == true)
                                transpose = (params.transpose == true)
                                dragBounds = nil
                                
                                if ( params.onPress and ( type(params.onPress) == "function" ) ) then
                                        g._onPress = params.onPress
                                end
                                if ( params.onDrag and ( type(params.onDrag) == "function" ) ) then
                                        g._onDrag = params.onDrag
                                end
                                if ( params.onRelease and ( type(params.onRelease) == "function" ) ) then
                                        g._onRelease = params.onRelease
                                end
                                if ( params.bounds and ( type(params.bounds) == "table" ) ) then
                                        dragBounds = params.bounds
                                        dragLeft = dragBounds[1]
                                        dragTop = dragBounds[2]
                                        dragWidth = dragBounds[3]
                                        dragHeight = dragBounds[4]
                                end
                                
                                g.touch = dragMe
                                g:addEventListener( "touch", g )
                                
                        else
                                g:removeEventListener( "touch", g )
                                dragBounds = nil
                                
                        end
                end
        end
 
 
        -- Optional function to assign text labels to frames
        function g:setLabels(labelTable)
                for k, v in next, labelTable do
                        if (type(k) == "string") then
                                animLabels[v] = k
                        end
                end          
        end
        
        -- Return instance of animation
        return g
end