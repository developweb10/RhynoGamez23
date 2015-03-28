module(..., package.seeall)

--====================================================================--
-- SCENE: game
--====================================================================--

new = function ( params )
movieclip = require("movieclip")
require("mcx")
local widget = require("widget")
_G.score = 0;

local monkey1 = mcx.new()
local timeline = mcx.newTimeline()
timeline:addObject(monkey1)

local monkeyE = mcx.sequence({name = "images/game/monkeyClimb/mc", extension = "png", startFrame = 1, endFrame = 40, zeros = 1})

local gameGroup = display.newGroup();
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local deviceWidth = display.contentWidth
local deviceHeight = display.contentHeight
local isstone = false;local count = 1; local score = 0;local numberofMonkeys = 0;local monkeysCount = 0;local numberofMonkey = 0;local monkeyMissing = 0;
local animSpeed = 2000;local sparrowOffset;
local audioClimb = audio.loadSound("music/branch climbing monkey.mp3");
local audioFallDown = audio.loadSound("music/falling down.mp3");
local audioGameOver = audio.loadSound("music/game over.mp3");
local audioGameWin = audio.loadSound("music/game win.mp3");
local audioBackground = audio.loadSound("music/2.mp3");--Sequence 01
local audioShoutin = audio.loadSound("music/shoutin.mp3");
--local audioSparrowChirping = audio.loadSound("music/sparrow chirping.mp3");
local audioSlingShot = audio.loadSound("music/sling shot.mp3");
local audioStartingMonkey = audio.loadSound("music/starting monkey.mp3");
local audiotongue = audio.loadSound("music/tongue.mp3");

local random = 0;

-- background Image 
local background = display.newImageRect( "images/game/gamebg.jpg", 1024, 768 )
background.x = deviceWidth/2
background.y = deviceHeight/2
gameGroup:insert(background);


local btnMusicOff
local btnMusicOn


	
local imageTable1 = {}

for i = 1,20 do
  table.insert( imageTable1, "images/game/branch/branch100" .. i .. ".png" )
end
			
branch1 = movieclip.newAnim(imageTable1)
branch1.alpha = 0;	
gameGroup:insert(branch1);


local imageTable2 = {}

for i = 1,20 do
  table.insert( imageTable2, "images/game/branch/branch100" .. i .. ".png" )
end
			
branch2 = movieclip.newAnim(imageTable2)
branch2.alpha = 0;	
gameGroup:insert(branch2);


local imageTable3 = {}

for i = 1,20 do
  table.insert( imageTable3, "images/game/branch/branch100" .. i .. ".png" )
end
			
branch3 = movieclip.newAnim(imageTable3)
branch3.alpha = 0;	
gameGroup:insert(branch3);


local imageTable4 = {}

for i = 1,20 do
  table.insert( imageTable4, "images/game/branch/branch100" .. i .. ".png" )
end
			
branch4 = movieclip.newAnim(imageTable4)
branch4.alpha = 0;	
gameGroup:insert(branch4);
local imageTable5 = {}

for i = 1,20 do
  table.insert( imageTable5, "images/game/branch/branch100" .. i .. ".png" )
end
			
branch5 = movieclip.newAnim(imageTable5)
branch5.alpha = 0;	
gameGroup:insert(branch5);


local imageTable7 = {}

for i = 1,20 do
  table.insert( imageTable7, "images/game/branch/branch100" .. i .. ".png" )
end
			
branch6 = movieclip.newAnim(imageTable7)
branch6.alpha = 0;	
gameGroup:insert(branch6);

local imageTable8 = {}

for i = 1,20 do
  table.insert( imageTable8, "images/game/branch/branch100" .. i .. ".png" )
end
			
branch7 = movieclip.newAnim(imageTable8)
branch7.alpha = 0;	
gameGroup:insert(branch7);

local imageTable9 = {}

for i = 1,20 do
  table.insert( imageTable9, "images/game/branch/branch100" .. i .. ".png" )
end
			
branch8 = movieclip.newAnim(imageTable9)
branch8.alpha = 0;	
gameGroup:insert(branch8);



branche1 = display.newImage("images/game/branch/branch1001.png")
branche1.alpha = 0;	
gameGroup:insert(branche1);

branche2 = display.newImage("images/game/branch/branch1002.png")
branche2.alpha = 0;	
gameGroup:insert(branche2);

branche3 = display.newImage("images/game/branch/branch1003.png")
branche3.alpha = 0;	
gameGroup:insert(branche3);

branch1R = display.newImage("images/bbranchhh.png")
branch1R.alpha = 0;	
gameGroup:insert(branch1R);
branch1R.anchorX = 0.5;
branch1R.anchorY = 0.0;

branch2R = display.newImage("images/bbranchhh.png")
branch2R.alpha = 0;	
gameGroup:insert(branch2R);
branch2R.anchorX = 0.5;
branch2R.anchorY = 0.0;

branch3R = display.newImage("images/bbranchhh.png")
branch3R.alpha = 0;	
gameGroup:insert(branch3R);
branch3R.anchorX = 0.5;
branch3R.anchorY = 0.0;

branch3R1 = display.newImage("images/bbranchhh.png")
branch3R1.alpha = 0;	
gameGroup:insert(branch3R1);
branch3R1.anchorX = 0.5;
branch3R1.anchorY = 0.0;

branch4R = display.newImage("images/bbranchhh.png")
branch4R.alpha = 0;	
gameGroup:insert(branch4R);
branch4R.anchorX = 0.5;
branch4R.anchorY = 0.0;

branch5R = display.newImage("images/bbranchhh.png")
branch5R.alpha = 0;	
gameGroup:insert(branch5R);
branch5R.anchorX = 0.5;
branch5R.anchorY = 0.0;

branch6R = display.newImage("images/bbranchhh.png")
branch6R.alpha = 0;	
gameGroup:insert(branch6R);
branch6R.anchorX = 0.5;
branch6R.anchorY = 0.0;

branch7R = display.newImage("images/bbranchhh.png")
branch7R.alpha = 0;	
gameGroup:insert(branch7R);
branch7R.anchorX = 0.5;
branch7R.anchorY = 0.0;

branch8R = display.newImage("images/bbranchhh.png")
branch8R.alpha = 0;	
gameGroup:insert(branch8R);
branch8R.anchorX = 0.5;
branch8R.anchorY = 0.0;




local function rotateBranch()
 trans = transition.to(branchx,{time = 300,delay = 0,rotation=21})
 trans = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans = transition.to(branchx,{time = 300,delay = 600,rotation=21})
 trans = transition.to(branchx,{time = 300,delay = 900,rotation=0})
 --monkeyx.x = branchx.x;
 trans = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x-48,y = monkeyx.y})
 trans = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x+10,y = monkeyx.y})
 trans = transition.to(monkeyx,{time = 300,delay = 600,x = monkeyx.x-48,y = monkeyx.y})
 trans = transition.to(monkeyx,{time = 300,delay =900,x = monkeyx.x+10,y = monkeyx.y})
end

local function shakeBranch()
trans = transition.to(branchy,{time = 300,delay = 0,rotation=10})
trans = transition.to(branchy,{time = 300,delay = 300,rotation=0})
trans = transition.to(branchy,{time = 300,delay = 0,rotation=10})
trans = transition.to(branchy,{time = 300,delay = 300,rotation=0})
end

local function rotateBranch1()
 trans = transition.to(branchx,{time = 300,delay = 0,rotation=-21})
 trans = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans = transition.to(branchx,{time = 300,delay = 600,rotation=-21})
 trans = transition.to(branchx,{time = 300,delay = 900,rotation=0})
 --monkeyx.x = branchx.x;
 trans = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x+48,y = monkeyx.y})
 trans = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x-10,y = monkeyx.y})
 trans = transition.to(monkeyx,{time = 300,delay = 600,x = monkeyx.x+48,y = monkeyx.y})
 trans = transition.to(monkeyx,{time = 300,delay =900,x = monkeyx.x-10,y = monkeyx.y})
end

local function shakeBranch1()
trans = transition.to(branchy,{time = 300,delay = 0,rotation=10})
trans = transition.to(branchy,{time = 300,delay = 300,rotation=0})
trans = transition.to(branchy,{time = 300,delay = 0,rotation=10})
trans = transition.to(branchy,{time = 300,delay = 300,rotation=0})
end


imageTablem3 = {}
for i = 1,14 do
  table.insert( imageTablem3, "images/game/monkeys new/c" .. i .. ".png" )
end

monkeyG1 = movieclip.newAnim(imageTablem3);
--mmonkey1.xScale = -1 
monkeyG1.tag = 1;
monkeyG1.alpha = 0;
monkeyG1:scale(0.4,0.4)	
--monkeyG1.width = 73.6;
--monkeyG1.height = 90;
local monkeyG1width = monkeyG1.width;
local monkeyG1height = monkeyG1.height;

print('before',monkeyG1width,monkeyG1height)

gameGroup:insert(monkeyG1);

imageTablem4 = {}
for i = 1,14 do
  table.insert( imageTablem4, "images/game/monkeys new/c" .. i .. ".png" )
end

monkeyG2 = movieclip.newAnim(imageTablem4);
monkeyG2.xScale = -1 
monkeyG2.tag = 1;
monkeyG2.alpha = 0;
monkeyG2.width = 110.4;
monkeyG2.height = 135;
local monkeyG2width = monkeyG2.width;
local monkeyG2height = monkeyG2.height;

gameGroup:insert(monkeyG2);

imageTablemG3 = {}
for i = 1,14 do
  table.insert( imageTablemG3, "images/game/monkeys new/c" .. i .. ".png" )
end

monkeyG3 = movieclip.newAnim(imageTablemG3);
--mmonkey1.xScale = -1 
monkeyG3.alpha = 0;
monkeyG3.tag = 1;
monkeyG3.width = 73.6;
monkeyG3.height = 90;
local monkeyG3width = monkeyG3.width;
local monkeyG3height = monkeyG3.height;
gameGroup:insert(monkeyG3);


imageTablemG4 = {}
for i = 1,14 do
  table.insert( imageTablemG4, "images/game/monkeys new/c" .. i .. ".png" )
end

monkeyG4 = movieclip.newAnim(imageTablemG4);
monkeyG4.xScale = -1 
monkeyG4.tag = 1;
monkeyG4.alpha = 0;
monkeyG4.width = 92;
monkeyG4.height = 112.5;
local monkeyG4width = monkeyG4.width;
local monkeyG4height = monkeyG4.height;
gameGroup:insert(monkeyG4);


--for more monkeys--
imageTablem3S = {}
for i = 1,14 do
  table.insert( imageTablem3S, "images/game/monkeys new/c" .. i .. ".png" )
end

monkeyG1S = movieclip.newAnim(imageTablem3S);
monkeyG1S.alpha = 0;
monkeyG1S.tag = 1;
monkeyG1S:scale(0.4,0.4)	
gameGroup:insert(monkeyG1S);

imageTablem4S = {}
for i = 1,14 do
  table.insert( imageTablem4S, "images/game/monkeys new/c" .. i .. ".png" )
end

monkeyG2S = movieclip.newAnim(imageTablem4S);
monkeyG2S.xScale = -1 
monkeyG2S.tag = 1;
monkeyG2S.alpha = 0;
monkeyG2S.width = 110.4;
monkeyG2S.height = 135;
gameGroup:insert(monkeyG2S);

imageTablemG3S = {}
for i = 1,14 do
  table.insert( imageTablemG3S, "images/game/monkeys new/c" .. i .. ".png" )
end

monkeyG3S = movieclip.newAnim(imageTablemG3S);
--mmonkey1.xScale = -1 
monkeyG3S.alpha = 0;
monkeyG3S.tag = 1;
monkeyG3S.width = 73.6;
monkeyG3S.height = 90;
gameGroup:insert(monkeyG3S);


imageTablemG4S = {}
for i = 1,14 do
  table.insert( imageTablemG4S, "images/game/monkeys new/c" .. i .. ".png" )
end

monkeyG4S = movieclip.newAnim(imageTablemG4S);
monkeyG4S.xScale = -1 
monkeyG4S.tag = 1;
monkeyG4S.alpha = 0;
monkeyG4S.width = 92;
monkeyG4S.height = 112.5;
gameGroup:insert(monkeyG4S);
--
--Branches positions--
branch1.x = deviceWidth-100;branch1.y = deviceHeight/2-60;
branch2.x = deviceWidth-250;branch2.y = deviceHeight/2-80;
branch3.x = deviceWidth-450;branch3.y = deviceHeight/2-100;
branch4.x = deviceWidth-580;branch4.y = deviceHeight/2-80;
branch5.x = deviceWidth-800;branch5.y = deviceHeight/2-40;
branch6.x = deviceWidth-950;branch6.y = deviceHeight/2+100;
branch7.x = deviceWidth-350;branch7.y = deviceHeight/2-40;
branch8.x = deviceWidth-700;branch8.y = deviceHeight/2-40;
branche1.x = deviceWidth-400;branche1.y = deviceHeight/2-70;
branche2.x = deviceWidth-650;branche2.y = deviceHeight/2-70;
branche3.x = deviceWidth-490;branche3.y = deviceHeight/2-70;


branch1R.x = deviceWidth-100;branch1R.y = deviceHeight/2-60-400;
branch2R.x = deviceWidth-250;branch2R.y = deviceHeight/2-80-400;
branch3R.x = deviceWidth-450;branch3R.y = deviceHeight/2-100-400;
branch3R1.x = deviceWidth-450;branch3R1.y = deviceHeight/2-100-400;
branch4R.x = deviceWidth-580;branch4R.y = deviceHeight/2-80-400;
branch5R.x = deviceWidth-800;branch5R.y = deviceHeight/2-40-400;
branch6R.x = deviceWidth-950;branch6R.y = deviceHeight/2+100-400;
branch7R.x = deviceWidth-350;branch7R.y = deviceHeight/2-40-400;
branch8R.x = deviceWidth-700;branch8R.y = deviceHeight/2-40-400;

--[[local imageTablemc1 = {}
for i = 1,31 do
  table.insert( imageTablemc1, "images/game/start monkey seq/mc" .. i .. ".png" )
end			
monkey1 = movieclip.newAnim(imageTablemc1)
--monkey1.xScale = -1;
monkey1:scale(0.9,0.9)
monkey1.alpha = 1;	
gameGroup:insert(monkey1);
monkey1.x = branch1.x ;monkey1.y = branch1.y-40+120;

local imageTablemc2 = {}
for i = 1,31 do
  table.insert( imageTablemc2, "images/game/start monkey seq/mc" .. i .. ".png" )
end			
monkey2 = movieclip.newAnim(imageTablemc2)
monkey2.alpha = 1;	
monkey2:scale(0.5,0.5)
gameGroup:insert(monkey2);
monkey2.x = branch2.x;monkey2.y = branch2.y-150+100;

local imageTablemc3 = {}
for i = 1,31 do
  table.insert( imageTablemc3, "images/game/start monkey seq/mc" .. i .. ".png" )
end			
monkey3 = movieclip.newAnim(imageTablemc3)
monkey3.xScale = -1 
monkey3.alpha = 1;
monkey3:scale(0.7,0.7)	
gameGroup:insert(monkey3);
monkey3.x = branch3.x;monkey3.y = branch3.y-120+50;



local imageTablemc4 = {}
for i = 1,31 do
  table.insert( imageTablemc4, "images/game/start monkey seq/mc" .. i .. ".png" )
end			
monkey4 = movieclip.newAnim(imageTablemc4)
monkey4.xScale = -1 
monkey4.alpha = 1;
monkey4:scale(0.75,0.75)	
gameGroup:insert(monkey4);
monkey4.x = branch4.x;monkey4.y = branch4.y-120+50;

local imageTablemc5 = {}
for i = 1,31 do
  table.insert( imageTablemc5, "images/game/start monkey seq/mc" .. i .. ".png" )
end			
monkey5 = movieclip.newAnim(imageTablemc5)
monkey5.xScale = -1 
monkey5.alpha = 1;
monkey5:scale(0.8,0.8)	
gameGroup:insert(monkey5);
monkey5.x = branch5.x;monkey5.y = branch5.y-120+100;

local imageTablemc6 = {}
for i = 1,31 do
  table.insert( imageTablemc6, "images/game/start monkey seq/mc" .. i .. ".png" )
end			
monkey6 = movieclip.newAnim(imageTablemc6)
monkey6.xScale = -1 
monkey6.alpha = 1;
monkey6:scale(1.0,1.0)	
gameGroup:insert(monkey6);
monkey6.x = branch6.x;monkey6.y = branch6.y-120+100;
--]]
monkeyTSheet = graphics.newImageSheet("images/game/tongue.png", { width= 270, height= 358, numFrames=2 } )
-- play 15 frames every 500 ms
toungueOut = display.newSprite( monkeyTSheet, { name="monkeyTSheet", start=1, count=2, time=500 } )
--toungueOut:scale(2.0,2.0);
toungueOut.alpha = 1;
gameGroup:insert(toungueOut);


sparrows = graphics.newImageSheet("images/game/SPARROW1-2.png", { width= 46, height= 41, numFrames=6 } )
-- play 15 frames every 500 ms
sparrow = display.newSprite( sparrows, { name="sparrows", start=1, count=6, time=500 } )
sparrow.x = 300;
sparrow.y = 200
sparrow.alpha = 0;
gameGroup:insert(sparrow);
--sparrow:play();

local leaves1 = display.newImageRect( "images/game/leaves.png", 1024, 449 )--1024
leaves1.x = deviceWidth/2-65
leaves1.y = 200.0
gameGroup:insert(leaves1);


local monkeyB1 = display.newImageRect( "images/game/start monkey seq/mc21.png", 1024, 768 )
monkeyB1.x = deviceWidth/2
monkeyB1.y = 200.0
monkeyB1.alpha = 1;
gameGroup:insert(monkeyB1);
monkeyB1.x = branch1.x;monkeyB1.y =branch1.y-1000;

local monkeyB2 = display.newImageRect( "images/game/start monkey seq/mc21.png",1024, 768 )
monkeyB2.x = deviceWidth/2
monkeyB2.y = 200.0
monkeyB2.alpha = 1;
gameGroup:insert(monkeyB2);
monkeyB2.x = branch2.x;monkeyB2.y = branch2.y-1000;

local monkeyB3 = display.newImageRect( "images/game/start monkey seq/mc21.png", 1024, 768 )
monkeyB3.x = deviceWidth/2
monkeyB3.y = 200.0
monkeyB3.alpha = 1;
gameGroup:insert(monkeyB3);
monkeyB3.x = branch3.x;monkeyB3.y = branch3.y-1000;

local monkeyB4 = display.newImageRect( "images/game/start monkey seq/mc21.png",1024, 768 )
monkeyB4.x = deviceWidth/2
monkeyB4.y = 200.0
monkeyB4.alpha = 1;
gameGroup:insert(monkeyB4);
monkeyB4.x = branch4.x;monkeyB4.y = branch4.y-1000;

local monkeyB5 = display.newImageRect( "images/game/start monkey seq/mc21.png", 1024, 768 )
monkeyB5.x = deviceWidth/2
monkeyB5.y = 200.0
monkeyB5.alpha = 1;
gameGroup:insert(monkeyB5);
monkeyB5.x = branch5.x;monkeyB5.y =branch5.y-1000;

local monkeyB6 = display.newImageRect( "images/game/start monkey seq/mc21.png", 1024, 768 )
monkeyB6.x = deviceWidth/2
monkeyB6.y = 200.0
monkeyB6.alpha = 1;
gameGroup:insert(monkeyB6);
monkeyB6.x = branch6.x;monkeyB6.y =branch6.y-1100;


local leaves = display.newImageRect( "images/game/leaves.png", 1200, 449 )--1024
leaves.x = deviceWidth/2
leaves.y = 200.0
gameGroup:insert(leaves);



print ('_G.musicOn',_G.musicOn);

--local musicOn = true
local function musicToggle( event )
print'fff'
    if _G.musicOn then
    	_G.musicOn = false
    	
    	 btnMusicOff.isVisible	 = false;
        btnMusicOn.isVisible	 = true;
        print( "musicOn off" )
        audio.stop();
       
    else
    	_G.musicOn = true
       
         btnMusicOff.isVisible	 = true;
        btnMusicOn.isVisible	 = false;
        print( "musicOn on" )
        PlayBackgroundMusic();
    end
    return true
end

-------------------------------- Music Off Button
btnMusicOff = widget.newButton
{
	width = 50,
  	height = 50,
  	defaultFile = "images/icons strt up/sound.png",
  	x = 40,
  	y = 40,
}
gameGroup:insert(btnMusicOff);
btnMusicOff:addEventListener("tap", musicToggle)
btnMusicOff.isVisible = false

-------------------------------- Music On Button
btnMusicOn = widget.newButton
{
	width = 50,
  	height = 50,
  	defaultFile = "images/icons strt up/mute.png",
  	x = 40,
  	y = 40,
}
gameGroup:insert(btnMusicOn);
btnMusicOn:addEventListener("tap", musicToggle)
btnMusicOn.isVisible = false;

if _G.musicOn == true then
btnMusicOff.isVisible = true;
else
btnMusicOn.isVisible = true;
end

local home = display.newImageRect( "images/game/GAME OVER SLICING/HOME ICON.png",40,40)
home.x = 100
home.y = 35
gameGroup:insert(home);

local slingShot = display.newImageRect("images/game/slingshot.png",168,296)
slingShot.x = deviceWidth/2+2;
slingShot.y = deviceHeight/2+350;
slingShot.alpha = 1;
gameGroup:insert(slingShot)

local stoneGroup = display.newImage( "images/game/stone group.png" )
stoneGroup.x = deviceWidth/2+200
stoneGroup.y = deviceHeight-20
stoneGroup:scale(0.6,0.6)
stoneGroup.alpha = 1;
gameGroup:insert(stoneGroup);

local stone = display.newImage( "images/game/stone.png" )
stone.x = deviceWidth/2+110
stone.y = deviceHeight+100
stone.alpha = 1;
gameGroup:insert(stone);

local banana = display.newImage( "images/game/monkey face.png" )
banana.x = deviceWidth-180
banana.y = 30
banana.alpha = 1;
gameGroup:insert(banana);

local cross = display.newImage( "images/game/cross.png" )
cross.x = deviceWidth-110
cross.y = 30
cross.alpha = 1;
gameGroup:insert(cross);

local scoreTxt = display.newText(score, deviceWidth-60 , 25, "Helvetica", 50 )
scoreTxt:setTextColor(1.0,1.0,0.0,1.0)
gameGroup:insert(scoreTxt);

local rect = display.newRect( deviceWidth/2,deviceHeight/2, 1024, 768 )
rect.x = deviceWidth/2
rect.y = deviceHeight/2
rect:setFillColor(1.0,1.0,1.0)
gameGroup:insert(rect);
rect.alpha = 0;

target = display.newImage( "images/game/target.png" )
target.x = deviceWidth/2+110
target.y = deviceHeight/2
target.alpha = 0;
gameGroup:insert(target);

local function leavesAnim()
transition.to( leaves, { time=4000,delay = 0,x=leaves.x-10} );
transition.to( leaves, { time=4000,delay = 4000,x=leaves.x+10,onComplete =leavesAnim} );
end

local function stoneAppear()
--branch1.alpha = 0;branch2.alpha = 0;branch3.alpha = 0;branch4.alpha = 0;branch5.alpha = 0;branch6.alpha = 0;
transition.to( stone, { time=400,delay = 0,x=stone.x,y= stone.y - 260} );

transition.to( stone, { time=400,delay = 400,x=stone.x-100,y= stone.y - 180} );
--transition.to( stone, { time=600,delay = 400,x=stone.x,y= stone.y - 230} );
--transition.to( stone, { time=500,delay = 1000,x=stone.x,y= stone.y - 270} );
isstone = true;

timer.performWithDelay(0,leavesAnim);
end

	function PlayBackgroundMusic()
	if _G.musicOn == true then
		local channelBackground1=audio.play(audioBackground,{loops = -1});
	end
	end


--functions to play audio
	local function audioPlay()
	--if _G.musicOn == true then
		local channelStartingMonkey=audio.play(audioStartingMonkey,{loops = 1});
	--end
	end

monkeyB6.xScale = -1 
monkeyB6:scale(1.0,1.0)
monkeyB5.xScale = -1 
monkeyB5:scale(0.8,0.8) 
monkeyB4.xScale = -1 
monkeyB4:scale(0.75,0.75)	
monkeyB3.xScale = -1
monkeyB3:scale(0.7,0.7)	
monkeyB2:scale(0.5,0.5) 
monkeyB1:scale(0.9,0.9)


local function monkey1Appear1()
--monkey1:play{ startFrame=16, endFrame=16, loop=1}

monkeyB1.anchorX = 0.5;
monkeyB1.anchorY = 0.0;
transition.to(monkeyB1,{time = 1000,y = monkeyB1.y+650})
transition.to(monkeyB1,{time = 600,delay = 1000,rotation = 10})
transition.to(monkeyB1,{time = 600,delay = 1600,rotation = -10})
transition.to(monkeyB1,{time = 600,delay = 2200,rotation = 10})
transition.to(monkeyB1,{time = 600,delay = 2800,rotation = -10})
transition.to(monkeyB1,{time = 600,delay = 3400,rotation = 0})
end
local function monkey2Appear1()
--monkey2:play{ startFrame=16, endFrame=16, loop=1}

monkeyB2.anchorX = 0.5;
monkeyB2.anchorY = 0.0;
transition.to(monkeyB2,{time = 800,y = monkeyB2.y+700})
transition.to(monkeyB2,{time = 600,delay = 800,rotation = 10})
transition.to(monkeyB2,{time = 600,delay = 1200,rotation = -10})
transition.to(monkeyB2,{time = 600,delay = 2000,rotation = 10})
transition.to(monkeyB2,{time = 600,delay = 2600,rotation = -10})
transition.to(monkeyB2,{time = 800,delay = 3200,rotation = 0})

end
local function monkey3Appear1()
--monkey3:play{ startFrame=16, endFrame=16, loop=1}

monkeyB3.anchorX = 0.5;
monkeyB3.anchorY = 0.0;
transition.to(monkeyB3,{time = 900,y = monkeyB3.y+700})
transition.to(monkeyB3,{time = 600,delay = 900,rotation = 20})
transition.to(monkeyB3,{time = 600,delay = 1500,rotation = -20})
transition.to(monkeyB3,{time = 600,delay = 2100,rotation = 20})
transition.to(monkeyB3,{time = 600,delay = 2700,rotation = -20})
transition.to(monkeyB3,{time = 700,delay = 3300,rotation = 0})

end
local function monkey4Appear1()

monkeyB4.anchorX = 0.5;
monkeyB4.anchorY = 0.0;
transition.to(monkeyB4,{time = 600,y = monkeyB4.y+700})
transition.to(monkeyB4,{time = 600,delay = 600,rotation = 10})
transition.to(monkeyB4,{time = 600,delay = 1200,rotation = -10})
transition.to(monkeyB4,{time = 600,delay = 1800,rotation = 10})
transition.to(monkeyB4,{time = 600,delay = 2400,rotation = -10})
transition.to(monkeyB4,{time = 1000,delay = 3000,rotation = 0})

--monkey4:play{ startFrame=16, endFrame=16, loop=1}
end
local function monkey5Appear1()

monkeyB5.anchorX = 0.5;
monkeyB5.anchorY = 0.0;
transition.to(monkeyB5,{time = 1000,y = monkeyB5.y+650})
transition.to(monkeyB5,{time = 600,delay = 1000,rotation = 10})
transition.to(monkeyB5,{time = 600,delay = 1600,rotation = -10})
transition.to(monkeyB5,{time = 600,delay = 2200,rotation = 10})
transition.to(monkeyB5,{time = 600,delay = 2800,rotation = -10})
transition.to(monkeyB5,{time = 600,delay = 3400,rotation = 0})

--monkey5:play{ startFrame=16, endFrame=16, loop=1}
end
local function monkey6Appear1()

monkeyB6.anchorX = 0.5;
monkeyB6.anchorY = 0.0;
transition.to(monkeyB6,{time = 1200,y = monkeyB6.y+650})
transition.to(monkeyB6,{time = 600,delay = 1200,rotation = 20})
transition.to(monkeyB6,{time = 600,delay = 1800,rotation = -20})
transition.to(monkeyB6,{time = 600,delay = 2400,rotation = 20})
transition.to(monkeyB6,{time = 600,delay = 3000,rotation = -20})
transition.to(monkeyB6,{time = 700,delay = 3600,rotation = 0})

--monkey6:play{ startFrame=16, endFrame=16, loop=1}
end

--timer.performWithDelay(1000,monkey1Appear1)


--timer.performWithDelay(1000,monkey2Appear1)

--timer.performWithDelay(1000,monkey3Appear1)

--timer.performWithDelay(1000,monkey4Appear1)

--timer.performWithDelay(1000,monkey5Appear1)

--timer.performWithDelay(1000,monkey6Appear1)


local function blinkScreen()
monkeyB1.alpha = 0;monkeyB2.alpha = 0;monkeyB3.alpha = 0;monkeyB4.alpha = 0;monkeyB5.alpha = 0;monkeyB6.alpha = 0;
rect.alpha = 1;
transition.to( rect, { time=2000,delay = 0,alpha = 0} );
timer.performWithDelay(2000,startGame);
end



local function videoPlay()

local videoObj = media.playVideo( "finalrender.mp4", true)
timer.performWithDelay(1000,blinkScreen);
end

timer.performWithDelay(1000,videoPlay)

timer.performWithDelay(100,audioPlay);



local function climbAudio()
--if _G.musicOn == true then
local channelaudioClimb=audio.play(audioClimb,{loops = 0});
--end
end

--first monkey--
local function rotateMonkey3fifth()
--monkeyG1.alpha = 0;
monkeyG1:play{ startFrame=1, endFrame=2, loop=1 }
t9 = timer.performWithDelay(200,secondRound);
branch6:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmove3fifth()
transition.cancel(tr3);
climbAudio();
monkeyG1.x = inPos1;
branch6.alpha = 1;
branch6R.alpha = 0;
tr4 = transition.to(monkeyG1,{time = 100,delay = 0,x = monkeyG1.x-650,y = monkeyG1.y+50,onComplete = rotateMonkey3fifth})
end

local function rotateMonkey3fourth()
monkeyG1:play{ startFrame=2, endFrame=2, loop=1 }

inPos1 = monkeyG1.x;
--branch6.alpha = 0;
branch6R.alpha = 1;
monkeyG1.x = branch6R.x;
monkeyG1.x = monkeyG1.x-95;
monkeyx = monkeyG1;
--trans = tr3;
branchx = branch6R;
--rotateBranch();

 trans1 = transition.to(branchx,{time = 300,delay = 0,rotation=20})
 trans1 = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans1 = transition.to(branchx,{time = 400,delay = 600,rotation=16})
 trans1 = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans1 = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x-48,y = monkeyx.y})
 trans1 = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x+49,y = monkeyx.y})
 trans1 = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x-28,y = monkeyx.y})
 trans1 = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x+40,y = monkeyx.y})
 
t8 = timer.performWithDelay(animSpeed,monkeysmove3fifth);
branch5:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmove3fourth()
transition.cancel(tr2);
climbAudio();
monkeyG1.x = inPos1;
branch5.alpha = 1;
branch5R.alpha = 0;
tr3 = transition.to(monkeyG1,{time = 100,delay = 0,x = monkeyG1.x-240,y = monkeyG1.y+50,onComplete = rotateMonkey3fourth})
end

local function rotateMonkey3third()
monkeyG1:play{ startFrame=2, endFrame=2, loop=1 }
inPos1 = monkeyG1.x;
--branch5.alpha = 0;
branch5R.alpha = 1;
monkeyG1.x = branch5R.x;
monkeyG1.x = monkeyG1.x;
monkeyx = monkeyG1;
--trans = tr2;
branchx = branch5R;
--rotateBranch();
trans2 = transition.to(branchx,{time = 300,delay = 0,rotation=20})
 trans2 = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans2 = transition.to(branchx,{time = 400,delay = 600,rotation=16})
 trans2 = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans2 = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x-49,y = monkeyx.y})
 trans2 = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x+49,y = monkeyx.y})
 trans2 = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x-29,y = monkeyx.y})
 trans2 = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x+40,y = monkeyx.y})

t7 = timer.performWithDelay(animSpeed,monkeysmove3fourth);
branch8:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmove3third()
transition.cancel(tr1);
climbAudio();
monkeyG1.x = inPos1;
branch8.alpha = 1;
branch8R.alpha = 0;
tr2 = transition.to(monkeyG1,{time = 100,delay = 0,x = monkeyG1.x-10,y = monkeyG1.y+50,onComplete = rotateMonkey3third})

end

local function rotateMonkey3sec()
sparrowOffset = 120;
monkeyG1:scale(1.5,1.5)	
monkeyG1:play{ startFrame=1, endFrame=1, loop=1 }

inPos1 = monkeyG1.x;
--branch8.alpha = 0;
branch8R.alpha = 1;
monkeyG1.x = branch8R.x;
monkeyG1.x = monkeyG1.x-100;
monkeyx = monkeyG1;
--trans = tr1;
branchx = branch8R;
--rotateBranch();

trans3 = transition.to(branchx,{time = 300,delay = 0,rotation=20})
 trans3 = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans3 = transition.to(branchx,{time = 400,delay = 600,rotation=16})
 trans3 = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans3 = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x-49,y = monkeyx.y})
 trans3 = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x+49,y = monkeyx.y})
 trans3 = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x-29,y = monkeyx.y})
 trans3 = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x+40,y = monkeyx.y})
 
t6 = timer.performWithDelay(animSpeed,monkeysmove3third);
branch4:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmove3sec()
monkeyG1.alpha = 1;
monkeyB1.alpha = 0;
print('sc',monkeyG1.contentWidth);
print('sc',monkeyG1.contentHeight);
transition.cancel(tr0);
climbAudio();
branch4.alpha = 1;
branch4R.alpha = 0;
monkeyG1.x = inPos1;
tr1 = transition.to(monkeyG1,{time =100,delay = 0,x = monkeyG1.x-210,y = monkeyG1.y,onComplete = rotateMonkey3sec})

end


local function rotateMonkey3()
sparrowOffset = 100;
monkeyG1:scale(1.2,1.2);
monkeyG1:play{ startFrame=1, endFrame=2, loop=1 }
inPos1 = monkeyG1.x;
--branch4.alpha = 0;
branch4R.alpha = 1;
monkeyG1.x = branch4R.x;
monkeyG1.x = monkeyG1.x-5;
monkeyx = monkeyG1;
--trans = tr0;
branchx = branch4R;
--rotateBranch();

 trans4 = transition.to(branchx,{time = 300,delay = 0,rotation=20})
 trans4 = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans4 = transition.to(branchx,{time = 400,delay = 600,rotation=16})
 trans4 = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans4 = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x-49,y = monkeyx.y})
 trans4 = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x+49,y = monkeyx.y})
 trans4 = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x-29,y = monkeyx.y})
 trans4 = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x+40,y = monkeyx.y})
t5 = timer.performWithDelay(animSpeed,monkeysmove3sec);
end

function monkeysmove3()

branch3.alpha = 1;
monkeyB1:scale(0.4,0.4);
sparrowOffset = 50;
climbAudio();
tr0 = transition.to(monkeyG1,{time = 100,delay = 100,x = monkeyG1.x-40,y = monkeyG1.y,onComplete = rotateMonkey3})

branch3:play{ startFrame=1, endFrame=2, loop=1 }
end
--first end--

--monkey 2nd --
local function rotateMonkey4fifth()
monkeyG2:play{ startFrame=1, endFrame=2, loop=1 }
t0 = timer.performWithDelay(200,secondRound);
--leaves:toFront(monkeyG2);
end
function monkeysmove4fifth()
transition.cancel(tr8);
climbAudio();
branch1.alpha = 1;
branch1R.alpha = 0;
monkeyG2.x = inPos2;
tr9 = transition.to(monkeyG2,{time = 100,delay = 0,x = monkeyG2.x+800,y = monkeyG2.y+100,onComplete = rotateMonkey4fifth})
branch2:play{ startFrame=2, endFrame=1, loop=1 }
--leaves:toFront(monkeyG2);
end

local function rotateMonkey4fourth()
monkeyG2:play{ startFrame=1, endFrame=1, loop=1 }


inPos2 = monkeyG2.x;
--branch1.alpha = 0;
branch1R.alpha = 1;
monkeyG2.x = branch1R.x;
monkeyG2.x = monkeyG2.x+100;
monkeyx = monkeyG2;
--trans = tr8;
branchx = branch1R;

 trans5 = transition.to(branchx,{time = 300,delay = 0,rotation=-16})
 trans5 = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans5 = transition.to(branchx,{time = 400,delay = 600,rotation=-12})
 trans5 = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans5 = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x+20,y = monkeyx.y})
 trans5 = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x-30,y = monkeyx.y})
 trans5 = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x+8,y = monkeyx.y})
 trans5 = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x-42,y = monkeyx.y})
 
--branch5:play{ startFrame=2, endFrame=1, loop=1 }

t4 = timer.performWithDelay(animSpeed,monkeysmove4fifth);
--leaves:toFront(monkeyG2);
end

function monkeysmove4fourth()

transition.cancel(tr7);
climbAudio();
branch2.alpha = 1;
branch2R.alpha = 0;
monkeyG2.x = inPos2;
tr8 = transition.to(monkeyG2,{time = 100,delay = 0,x = monkeyG2.x+240,y = monkeyG2.y+50,onComplete = rotateMonkey4fourth})
--leaves:toFront(monkeyG2);
end


local function rotateMonkey4third()
monkeyG2:play{ startFrame=2, endFrame=2, loop=1 }

inPos2 = monkeyG2.x;
--branch2.alpha = 0;
branch2R.alpha = 1;
monkeyG2.x = branch2R.x;
monkeyG2.x = monkeyG2.x-2;
monkeyx = monkeyG2;
--trans = tr7;
branchx = branch2R;
--rotateBranch1();

 trans6 = transition.to(branchx,{time = 300,delay = 0,rotation=-16})
 trans6 = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans6 = transition.to(branchx,{time = 400,delay = 600,rotation=-12})
 trans6 = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans6 = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x+20,y = monkeyx.y})
 trans6 = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x-30,y = monkeyx.y})
 trans6 = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x+8,y = monkeyx.y})
 trans6 = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x-42,y = monkeyx.y})
 

t3 = timer.performWithDelay(animSpeed,monkeysmove4fourth);
--leaves:toFront(monkeyG2);
end

function monkeysmove4third()
transition.cancel(tr6);
climbAudio();
monkeyG2.x = inPos2;
branch7.alpha = 1;
branch7R.alpha = 0;
tr7 = transition.to(monkeyG2,{time = 100,delay = 0,x = monkeyG2.x-20,y = monkeyG2.y-20,onComplete = rotateMonkey4third})

branch3:play{ startFrame=2, endFrame=1, loop=1 }
end


local function rotateMonkey4sec()
monkeyG2:scale(1.2,1.2)
sparrowOffset = 100;
monkeyG2:play{ startFrame=1, endFrame=1, loop=1 }

inPos2 = monkeyG2.x;
--branch7.alpha = 0;
branch7R.alpha = 1;
monkeyG2.x = branch7R.x;
monkeyG2.x = monkeyG2.x+85;
monkeyx = monkeyG2;
--trans = tr6;
branchx = branch7R;
--rotateBranch1();
 trans7 = transition.to(branchx,{time = 300,delay = 0,rotation=-20})
 trans7 = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans7 = transition.to(branchx,{time = 400,delay = 600,rotation=-16})
 trans7 = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans7 = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x+51,y = monkeyx.y})
 trans7 = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x-49,y = monkeyx.y})
 trans7 = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x+31,y = monkeyx.y})
 trans7 = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x-39,y = monkeyx.y})
 
t2 = timer.performWithDelay(animSpeed,monkeysmove4third);
end


function monkeysmove4sec()
transition.cancel(tr5);
climbAudio();
monkeyG2.x = inPos2;
branch3.alpha = 1;
branch3R1.alpha = 0;
tr6 = transition.to(monkeyG2,{time = 100,delay = 0,x = monkeyG2.x+205,y = monkeyG2.y,onComplete = rotateMonkey4sec})

branch4:play{ startFrame=2, endFrame=1, loop=1 }
end


local function rotateMonkey4()
monkeyG2:scale(1.2,1.2)
sparrowOffset = 100;	
monkeyG2:play{ startFrame=2, endFrame=2, loop=1 }

inPos2 = monkeyG2.x;
--branch3.alpha = 0;
branch3R1.alpha = 1;
monkeyG2.x = branch3R1.x;
monkeyG2.x = monkeyG2.x+3;
monkeyx = monkeyG2;
--trans = tr5;
branchx = branch3R1;
--rotateBranch1();

 trans8 = transition.to(branchx,{time = 300,delay = 0,rotation=-19})
 trans8 = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans8 = transition.to(branchx,{time = 400,delay = 600,rotation=-15})
 trans8 = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans8 = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x+49,y = monkeyx.y})
 trans8 = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x-51,y = monkeyx.y})
 trans8 = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x+28,y = monkeyx.y})
 trans8 = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x-43,y = monkeyx.y})

t1 = timer.performWithDelay(animSpeed,monkeysmove4sec);
end


function monkeysmove4()

branch4.alpha = 1;

sparrowOffset = 50;
climbAudio();
tr5 = transition.to(monkeyG2,{time = 100,delay = 100,x = monkeyG2.x+35,y = monkeyG2.y,onComplete = rotateMonkey4})

branch4:play{ startFrame=1, endFrame=2, loop=1 }
end
--monkey 2nd end--

--third monkey -- 
local function rotateMonkeyG3sev()
monkeyG3:play{ startFrame=2, endFrame=2, loop=1 }
t16 = timer.performWithDelay(200,secondRound);
branch6:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmoveG3six()
transition.cancel(tr14);
climbAudio();
monkeyG3.x = inPos3;
branch6.alpha = 1;
branch6R.alpha = 0;
tr15 = transition.to(monkeyG3,{time = 100,delay = 0,x = monkeyG3.x-600,y = monkeyG3.y+50,onComplete = rotateMonkeyG3sev})
end

local function rotateMonkeyG3six()

monkeyG3:play{ startFrame=2, endFrame=2, loop=1 }
--monkeyG3:scale(1.2,1.2)	
inPos3 = monkeyG3.x;
--branch6.alpha = 0;
branch6R.alpha = 1;
monkeyG3.x = branch6R.x;
monkeyG3.x = monkeyG3.x+10;
monkeyx = monkeyG3;
--trans = tr14;
branchx = branch6R;
--rotateBranch();
 trans9 = transition.to(branchx,{time = 300,delay = 0,rotation=20})
 trans9 = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans9 = transition.to(branchx,{time = 400,delay = 600,rotation=16})
 trans9 = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans9 = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x-49,y = monkeyx.y})
 trans9 = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x+49,y = monkeyx.y})
 trans9 = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x-29,y = monkeyx.y})
 trans9 = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x+40,y = monkeyx.y})
 
t15 = timer.performWithDelay(animSpeed,monkeysmoveG3six);
branch5:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmoveG3fiv()
transition.cancel(tr13);
climbAudio();
monkeyG3.x = inPos3;
branch5.alpha = 1;
branch5R.alpha = 0;
tr14 = transition.to(monkeyG3,{time = 100,delay = 0,x = monkeyG3.x,y = monkeyG3.y+45,onComplete = rotateMonkeyG3six})
end

local function rotateMonkeyG3fiv()
monkeyG3:play{ startFrame=1, endFrame=1, loop=1 }
monkeyG3:scale(1.9,1.9)
sparrowOffset = 140;

inPos3 = monkeyG3.x;
--branch5.alpha = 0;
branch5R.alpha = 1;
monkeyG3.x = branch5R.x;
monkeyG3.x = monkeyG3.x-86;
monkeyx = monkeyG3;
--trans = tr13;
branchx = branch5R;
--rotateBranch();
 trans10 = transition.to(branchx,{time = 300,delay = 0,rotation=20})
 trans10 = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans10 = transition.to(branchx,{time = 400,delay = 600,rotation=16})
 trans10 = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans10 = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x-49,y = monkeyx.y})
 trans10 = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x+49,y = monkeyx.y})
 trans10 = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x-29,y = monkeyx.y})
 trans10 = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x+40,y = monkeyx.y})

t14 = timer.performWithDelay(animSpeed,monkeysmoveG3fiv);
branch8:play{ startFrame=2, endFrame=1, loop=1 }

end
function monkeysmoveG3four()
transition.cancel(tr12);
climbAudio();
monkeyG3.x = inPos3;
branch8.alpha = 1;
branch8R.alpha = 0;
tr13 = transition.to(monkeyG3,{time = 100,delay = 0,x = monkeyG3.x-215,y = monkeyG3.y-10,onComplete = rotateMonkeyG3fiv})
end

local function rotateMonkeyG3four()

monkeyG3:play{ startFrame=2, endFrame=2, loop=1 }
--monkeyG3:scale(1.6,1.6)	
inPos3 = monkeyG3.x;
--branch8.alpha = 0;
branch8R.alpha = 1;
monkeyG3.x = branch8R.x;
monkeyG3.x = monkeyG3.x-10;
monkeyx = monkeyG3;
--trans = tr12;
branchx = branch8R;
--rotateBranch();
trans11 = transition.to(branchx,{time = 300,delay = 0,rotation=20})
 trans11 = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans11 = transition.to(branchx,{time = 400,delay = 600,rotation=16})
 trans11 = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans11 = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x-49,y = monkeyx.y})
 trans11 = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x+49,y = monkeyx.y})
 trans11 = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x-29,y = monkeyx.y})
 trans11 = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x+40,y = monkeyx.y})
 
t13 = timer.performWithDelay(animSpeed,monkeysmoveG3four);
branch4:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmoveG3third()
transition.cancel(tr11);
climbAudio();
monkeyG3.x = inPos3;
branch4.alpha = 1;
branch4R.alpha = 0;
tr12 = transition.to(monkeyG3,{time =100,delay = 0,x = monkeyG3.x-50,y = monkeyG3.y-20,onComplete = rotateMonkeyG3four})
end


local function rotateMonkeyG3third()
monkeyG3:play{ startFrame=1, endFrame=1, loop=1 }
t12 = timer.performWithDelay(animSpeed,monkeysmoveG3third);
inPos3 = monkeyG3.x;
--branch4.alpha = 0;
branch4R.alpha = 1;
monkeyG3.x = branch4R.x;
monkeyG3.x = monkeyG3.x-80;
monkeyx = monkeyG3;
--trans = tr11;
branchx = branch4R;
--rotateBranch();
trans12 = transition.to(branchx,{time = 300,delay = 0,rotation=20})
 trans12 = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans12 = transition.to(branchx,{time = 400,delay = 600,rotation=16})
 trans12 = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans12 = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x-49,y = monkeyx.y})
 trans12 = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x+49,y = monkeyx.y})
 trans12 = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x-29,y = monkeyx.y})
 trans12 = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x+48,y = monkeyx.y})

branch3:play{ startFrame=2, endFrame=1, loop=1 }
end


function monkeysmoveG3sec()
transition.cancel(tr10);
climbAudio();
monkeyG3.x = inPos3;
branch3.alpha = 1;
branch3R.alpha = 0;

tr11 = transition.to(monkeyG3,{time =100,delay = 0,x = monkeyG3.x-200,y = monkeyG3.y-30,onComplete = rotateMonkeyG3third})
end


local function rotateMonkeyG3first()

monkeyG3:play{ startFrame=2, endFrame=2, loop=1 }
monkeyG3:scale(1.2,1.2)	
sparrowOffset = 100;
branch8:play{ startFrame=1, endFrame=2, loop=1 }

inPos3 = monkeyG3.x;
--branch3.alpha = 0;
branch3R.alpha = 1;
monkeyG3.x = branch3R.x;
monkeyG3.x = monkeyG3.x-20;
monkeyx = monkeyG3;
--trans = tr10;
branchx = branch3R;
--rotateBranch();

trans13 = transition.to(branchx,{time = 300,delay = 0,rotation=20})
 trans13 = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans13 = transition.to(branchx,{time = 400,delay = 600,rotation=16})
 trans13 = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans13 = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x-56,y = monkeyx.y})
 trans13 = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x+49,y = monkeyx.y})
 trans13 = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x-41,y = monkeyx.y})
 trans13 = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x+41,y = monkeyx.y})
 

t10 = timer.performWithDelay(animSpeed,monkeysmoveG3sec);
end


local function monkeysmoveG3()

branch8.alpha = 1;

climbAudio();
tr10 = transition.to(monkeyG3,{time = 100,delay = 100,x = monkeyG3.x-30,y = monkeyG3.y-50,onComplete = rotateMonkeyG3first})
end

--third monkey end--

--fourth monkey --

local function rotateMonkeyG4sev()
monkeyG4:play{ startFrame=1, endFrame=2, loop=1 }
t22 = timer.performWithDelay(200,secondRound);
branch1:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmoveG4six()
transition.cancel(tr21);
climbAudio();
monkeyG4.x = inPos4;
branch1.alpha = 1;
branch1R.alpha = 0;
tr22 = transition.to(monkeyG4,{time = 100,delay = 0,x = monkeyG4.x+600,y = monkeyG4.y+50,onComplete = rotateMonkeyG4sev})
end

local function rotateMonkeyG4six()

monkeyG4:play{ startFrame=2, endFrame=2, loop=1 }
--monkeyG3:scale(1.2,1.2)	

inPos4 = monkeyG4.x;
--branch1.alpha = 0;
branch1R.alpha = 1;
monkeyG4.x = branch1R.x;
monkeyG4.x = monkeyG4.x;
monkeyx = monkeyG4;
--trans = tr21;
branchx = branch1R;
--rotateBranch1();
trans14 = transition.to(branchx,{time = 300,delay = 0,rotation=-19})
 trans14 = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans14 = transition.to(branchx,{time = 400,delay = 600,rotation=-15})
 trans14 = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans14 = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x+49,y = monkeyx.y})
 trans14 = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x-51,y = monkeyx.y})
 trans14 = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x+28,y = monkeyx.y})
 trans14 = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x-43,y = monkeyx.y})
 
t21 = timer.performWithDelay(animSpeed,monkeysmoveG4six);
branch2:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmoveG4fiv()
transition.cancel(tr20);
climbAudio();
monkeyG4.x = inPos4;
branch2.alpha = 1;
branch2R.alpha = 0;
tr21 = transition.to(monkeyG4,{time = 100,delay = 0,x = monkeyG4.x+20,y = monkeyG4.y,onComplete = rotateMonkeyG4six})
end

local function rotateMonkeyG4fiv()
monkeyG4:play{ startFrame=1, endFrame=1, loop=1 }
monkeyG4:scale(1.1,1.1)
sparrowOffset = 90;

inPos4 = monkeyG4.x;
--branch2.alpha = 0;
branch2R.alpha = 1;
monkeyG4.x = branch2R.x;
monkeyG4.x = monkeyG4.x+100;
monkeyx = monkeyG4;
--trans = tr20;
branchx = branch2R;
--rotateBranch1();
trans15 = transition.to(branchx,{time = 300,delay = 0,rotation=-19})
 trans15 = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans15 = transition.to(branchx,{time = 400,delay = 600,rotation=-15})
 trans15 = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans15 = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x+49,y = monkeyx.y})
 trans15 = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x-51,y = monkeyx.y})
 trans15 = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x+28,y = monkeyx.y})
 trans15 = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x-43,y = monkeyx.y})
t20 = timer.performWithDelay(animSpeed,monkeysmoveG4fiv);
branch7:play{ startFrame=2, endFrame=1, loop=1 }

end
function monkeysmoveG4four()
transition.cancel(tr19);
climbAudio();
monkeyG4.x = inPos4;
branch7.alpha = 1;
branch7R.alpha = 0;

tr20 = transition.to(monkeyG4,{time = 100,delay = 0,x = monkeyG4.x+230,y = monkeyG4.y-50,onComplete = rotateMonkeyG4fiv})
end

local function rotateMonkeyG4four()

monkeyG4:play{ startFrame=2, endFrame=2, loop=1 }
monkeyG4:scale(1.4,1.4)	
sparrowOffset = 110;

inPos4 = monkeyG4.x;
--branch7.alpha = 0;
branch7R.alpha = 1;
monkeyG4.x = branch7R.x;
monkeyG4.x = monkeyG4.x+5;
monkeyx = monkeyG4;
--trans = tr19;
branchx = branch7R;
--rotateBranch1();

trans16 = transition.to(branchx,{time = 300,delay = 0,rotation=-19})
 trans16 = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans16 = transition.to(branchx,{time = 400,delay = 600,rotation=-15})
 trans16 = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans16 = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x+49,y = monkeyx.y})
 trans16 = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x-51,y = monkeyx.y})
 trans16 = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x+28,y = monkeyx.y})
 trans16 = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x-44,y = monkeyx.y})

t19 = timer.performWithDelay(animSpeed,monkeysmoveG4four);
branch3:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmoveG4third()
transition.cancel(tr18);
climbAudio();
monkeyG4.x = inPos4;
branch3.alpha = 1;
branch3R.alpha = 0;
tr19 = transition.to(monkeyG4,{time =100,delay = 0,x = monkeyG4.x-20,y = monkeyG4.y+50,onComplete = rotateMonkeyG4four})
end

local function rotateMonkeyG4third()
monkeyG4:play{ startFrame=1, endFrame=1, loop=1 }

inPos4 = monkeyG4.x;
--branch3.alpha = 0;
branch3R.alpha = 1;
monkeyG4.x = branch3R.x;
monkeyG4.x = monkeyG4.x+83;
monkeyx = monkeyG4;
--trans = tr18;
branchx = branch3R;
--rotateBranch1();

trans17 = transition.to(branchx,{time = 300,delay = 0,rotation=-19})
 trans17 = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans17 = transition.to(branchx,{time = 400,delay = 600,rotation=-15})
 trans17 = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans17 = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x+50,y = monkeyx.y})
 trans17 = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x-54,y = monkeyx.y})
 trans17 = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x+35,y = monkeyx.y})
 trans17 = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x-44,y = monkeyx.y})
 
t18 = timer.performWithDelay(animSpeed,monkeysmoveG4third);

branch4:play{ startFrame=2, endFrame=1, loop=1 }
end


function monkeysmoveG4sec()
transition.cancel(tr17);
climbAudio();
monkeyG4.x = inPos4;
branch8.alpha = 1;
branch8R.alpha = 0;
tr18 = transition.to(monkeyG4,{time =100,delay = 0,x = monkeyG4.x+218,y = monkeyG4.y-20,onComplete = rotateMonkeyG4third})
end

local function rotateMonkeyG4first()

monkeyG4:play{ startFrame=2, endFrame=2, loop=1 }
monkeyG4:scale(1.2,1.2)
sparrowOffset = 100;
--branch8:play{ startFrame=1, endFrame=2, loop=1 }

inPos4 = monkeyG4.x;
--branch8.alpha = 0;
branch8R.alpha = 1;
monkeyG4.x = branch8R.x;
monkeyG4.x = monkeyG4.x+4;
monkeyx = monkeyG4;
--trans = tr17;
branchx = branch8R;
--rotateBranch1();

trans18 = transition.to(branchx,{time = 300,delay = 0,rotation=-19})
 trans18 = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans18 = transition.to(branchx,{time = 400,delay = 600,rotation=-15})
 trans18 = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans18 = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x+55,y = monkeyx.y})
 trans18 = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x-51,y = monkeyx.y})
 trans18 = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x+35,y = monkeyx.y})
 trans18 = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x-43,y = monkeyx.y})

t17 = timer.performWithDelay(animSpeed,monkeysmoveG4sec);
end

local function monkeysmoveG4()

branch8.alpha = 1;
climbAudio();
tr17 = transition.to(monkeyG4,{time = 100,delay = 100,x = monkeyG4.x+50,y = monkeyG4.y,onComplete = rotateMonkeyG4first})
end
--end fourth--


-----------------------------------------------------------------------------------------
--FOR MORE MONKEYS
-----------------------------------------------------------------------------------------
--first monkey--
--[[local function rotateMonkey3fifthS()
monkeyG1S:play{ startFrame=1, endFrame=2, loop=1 }
t9S = timer.performWithDelay(animSpeed+500,secondRound);
branch6:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmove3fifthS()
transition.cancel(tr3S);
climbAudio();
tr4S = transition.to(monkeyG1S,{time = 100,delay = 0,x = monkeyG1S.x-650,y = monkeyG1S.y+50,onComplete = rotateMonkey3fifthS})
end

local function rotateMonkey3fourthS()
monkeyG1S:play{ startFrame=2, endFrame=1, loop=1 }
t8S = timer.performWithDelay(animSpeed,monkeysmove3fifthS);
branch5:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmove3fourthS()
transition.cancel(tr2S);
climbAudio();
tr3S = transition.to(monkeyG1S,{time = 100,delay = 0,x = monkeyG1S.x-240,y = monkeyG1S.y+50,onComplete = rotateMonkey3fourthS})
end

local function rotateMonkey3thirdS()
monkeyG1S:play{ startFrame=1, endFrame=2, loop=1 }
t7S = timer.performWithDelay(animSpeed,monkeysmove3fourthS);
branch8:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmove3thirdS()
transition.cancel(tr1S);
climbAudio();
tr2S = transition.to(monkeyG1S,{time =100,delay = 0,x = monkeyG1S.x-10,y = monkeyG1S.y+50,onComplete = rotateMonkey3thirdS})

end

local function rotateMonkey3secS()
monkeyG1S:scale(1.5,1.5)	
sparrowOffset = 120;
monkeyG1S:play{ startFrame=2, endFrame=1, loop=1 }
t6S = timer.performWithDelay(animSpeed,monkeysmove3thirdS);
branch4:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmove3secS()
transition.cancel(tr0S);
climbAudio();
tr1S = transition.to(monkeyG1S,{time =100,delay = 0,x = monkeyG1S.x-210,y = monkeyG1S.y,onComplete = rotateMonkey3secS})

end


local function rotateMonkey3S()
monkeyG1S:scale(1.2,1.2);
sparrowOffset = 100;
monkeyG1S:play{ startFrame=1, endFrame=2, loop=1 }
t5S = timer.performWithDelay(animSpeed,monkeysmove3secS);
end


function monkeysmove3S()
sparrowOffset = 50;
climbAudio();
tr0S = transition.to(monkeyG1S,{time = 100,delay = 100,x = monkeyG1S.x-40,y = monkeyG1S.y,onComplete = rotateMonkey3S})

branch3:play{ startFrame=1, endFrame=2, loop=1 }
end
--first end--

--monkey 2nd --
local function rotateMonkey4fifthS()
monkeyG2S:play{ startFrame=1, endFrame=2, loop=1 }

t0S = timer.performWithDelay(animSpeed+500,secondRound);
end
function monkeysmove4fifthS()
transition.cancel(tr8S);
climbAudio();
tr9S = transition.to(monkeyG2S,{time = 100,delay = 0,x = monkeyG2S.x+800,y = monkeyG2S.y+100,onComplete = rotateMonkey4fifthS})

branch2:play{ startFrame=2, endFrame=1, loop=1 }
end

local function rotateMonkey4fourthS()
monkeyG2S:play{ startFrame=2, endFrame=1, loop=1 }
t4S = timer.performWithDelay(animSpeed,monkeysmove4fifthS);
branch5:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmove4fourthS()
transition.cancel(tr7S);
climbAudio();
tr8S = transition.to(monkeyG2S,{time = 100,delay = 0,x = monkeyG2S.x+300,y = monkeyG2S.y+50,onComplete = rotateMonkey4fourthS})

end

local function rotateMonkey4thirdS()
monkeyG2S:play{ startFrame=1, endFrame=2, loop=1 }
t3S = timer.performWithDelay(animSpeed,monkeysmove4fourthS);
end

function monkeysmove4thirdS()
transition.cancel(tr6S);
tr7S = transition.to(monkeyG2S,{time = 100,delay = 0,x = monkeyG2S.x-20,y = monkeyG2S.y,onComplete = rotateMonkey4thirdS})

branch3:play{ startFrame=2, endFrame=1, loop=1 }
end


local function rotateMonkey4secS()
monkeyG2S:scale(1.2,1.2)
sparrowOffset = 100;
monkeyG2S:play{ startFrame=2, endFrame=1, loop=1 }
t2S = timer.performWithDelay(animSpeed,monkeysmove4thirdS);
end


function monkeysmove4secS()
transition.cancel(tr5S);
tr6S = transition.to(monkeyG2S,{time = 100,delay = 0,x = monkeyG2S.x+220,y = monkeyG2S.y,onComplete = rotateMonkey4secS})

branch4:play{ startFrame=2, endFrame=1, loop=1 }
end


local function rotateMonkey4S()
monkeyG2S:scale(1.2,1.2)	
sparrowOffset = 100;
monkeyG2S:play{ startFrame=1, endFrame=2, loop=1 }
t1S = timer.performWithDelay(animSpeed,monkeysmove4secS);
end


function monkeysmove4S()

tr5S = transition.to(monkeyG2S,{time = 100,delay = 100,x = monkeyG2S.x+20,y = monkeyG2S.y,onComplete = rotateMonkey4S})

branch5:play{ startFrame=1, endFrame=2, loop=1 }
end
--monkey 2nd end--

--third monkey -- 
local function rotateMonkeyG3sevS()
monkeyG3S:play{ startFrame=1, endFrame=2, loop=1 }
t16S = timer.performWithDelay(animSpeed+500,secondRound);
branch6:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmoveG3sixS()
transition.cancel(tr14S);
climbAudio();
tr15S = transition.to(monkeyG3S,{time = 100,delay = 0,x = monkeyG3S.x-600,y = monkeyG3S.y+50,onComplete = rotateMonkeyG3sevS})
end

local function rotateMonkeyG3sixS()

monkeyG3S:play{ startFrame=1, endFrame=2, loop=1 }
--monkeyG3:scale(1.2,1.2)	
t15S = timer.performWithDelay(animSpeed,monkeysmoveG3sixS);
branch5:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmoveG3fivS()
transition.cancel(tr13S);
climbAudio();
tr14S = transition.to(monkeyG3S,{time = 100,delay = 0,x = monkeyG3S.x,y = monkeyG3S.y+45,onComplete = rotateMonkeyG3sixS})
end

local function rotateMonkeyG3fivS()
monkeyG3S:play{ startFrame=2, endFrame=1, loop=1 }
monkeyG3S:scale(1.9,1.9)
sparrowOffset = 140;
t14S = timer.performWithDelay(animSpeed,monkeysmoveG3fivS);
branch8:play{ startFrame=2, endFrame=1, loop=1 }

end
function monkeysmoveG3fourS()
transition.cancel(tr12S);
climbAudio();
tr13S = transition.to(monkeyG3S,{time = 100,delay = 0,x = monkeyG3S.x-215,y = monkeyG3S.y-10,onComplete = rotateMonkeyG3fivS})
end

local function rotateMonkeyG3fourS()

monkeyG3S:play{ startFrame=1, endFrame=2, loop=1 }
--monkeyG3:scale(1.6,1.6)	
t13S = timer.performWithDelay(animSpeed,monkeysmoveG3fourS);
branch4:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmoveG3thirdS()
transition.cancel(tr11S);
climbAudio();
tr12S = transition.to(monkeyG3S,{time =100,delay = 0,x = monkeyG3S.x-50,y = monkeyG3S.y-20,onComplete = rotateMonkeyG3fourS})
end


local function rotateMonkeyG3thirdS()
monkeyG3S:play{ startFrame=2, endFrame=1, loop=1 }
t12S = timer.performWithDelay(animSpeed,monkeysmoveG3thirdS);

branch3:play{ startFrame=2, endFrame=1, loop=1 }
end


function monkeysmoveG3secS()
transition.cancel(tr10S);
climbAudio();
tr11S = transition.to(monkeyG3S,{time =100,delay = 0,x = monkeyG3S.x-200,y = monkeyG3S.y-30,onComplete = rotateMonkeyG3thirdS})
end

local function rotateMonkeyG3firstS()

monkeyG3S:play{ startFrame=1, endFrame=2, loop=1 }
monkeyG3S:scale(1.2,1.2)
sparrowOffset = 100;	
branch7:play{ startFrame=1, endFrame=2, loop=1 }
t10S = timer.performWithDelay(animSpeed,monkeysmoveG3secS);
end


local function monkeysmoveG3S()
sparrowOffset = 50;
climbAudio();
tr10S = transition.to(monkeyG3S,{time = 100,delay = 100,x = monkeyG3S.x-30,y = monkeyG3S.y-50,onComplete = rotateMonkeyG3firstS})
end

--third monkey end--

--fourth monkey --

local function rotateMonkeyG4sevS()
monkeyG4S:play{ startFrame=1, endFrame=2, loop=1 }
t22S = timer.performWithDelay(animSpeed+500,secondRound);
branch1:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmoveG4sixS()
transition.cancel(tr21S);
climbAudio();
tr22S = transition.to(monkeyG4S,{time = 100,delay = 0,x = monkeyG4S.x+600,y = monkeyG4S.y+50,onComplete = rotateMonkeyG4sevS})
end

local function rotateMonkeyG4sixS()

monkeyG4S:play{ startFrame=1, endFrame=2, loop=1 }
--monkeyG3:scale(1.2,1.2)	
t21S = timer.performWithDelay(animSpeed,monkeysmoveG4sixS);
branch2:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmoveG4fivS()
transition.cancel(tr20S);
climbAudio();
tr21S = transition.to(monkeyG4S,{time = 100,delay = 0,x = monkeyG4S.x+20,y = monkeyG4S.y,onComplete = rotateMonkeyG4sixS})
end

local function rotateMonkeyG4fivS()
monkeyG4S:play{ startFrame=2, endFrame=1, loop=1 }
monkeyG4S:scale(1.1,1.1)
sparrowOffset = 90;
t20S = timer.performWithDelay(animSpeed,monkeysmoveG4fivS);
branch7:play{ startFrame=2, endFrame=1, loop=1 }

end
function monkeysmoveG4fourS()
transition.cancel(tr19S);
climbAudio();
tr20S = transition.to(monkeyG4S,{time = 100,delay = 0,x = monkeyG4S.x+230,y = monkeyG4S.y-50,onComplete = rotateMonkeyG4fivS})
end

local function rotateMonkeyG4fourS()

monkeyG4S:play{ startFrame=1, endFrame=2, loop=1 }
monkeyG4S:scale(1.4,1.4)	
sparrowOffset = 120;
t19S = timer.performWithDelay(animSpeed,monkeysmoveG4fourS);
branch3:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmoveG4thirdS()
transition.cancel(tr18S);
climbAudio();
tr19S = transition.to(monkeyG4S,{time =100,delay = 0,x = monkeyG4S.x-20,y = monkeyG4S.y+50,onComplete = rotateMonkeyG4fourS})
end

local function rotateMonkeyG4thirdS()
monkeyG4S:play{ startFrame=2, endFrame=1, loop=1 }
t18S = timer.performWithDelay(animSpeed,monkeysmoveG4thirdS);

branch4:play{ startFrame=2, endFrame=1, loop=1 }
end


function monkeysmoveG4secS()
transition.cancel(tr17S);
climbAudio();
tr18S = transition.to(monkeyG4S,{time =100,delay = 0,x = monkeyG4S.x+218,y = monkeyG4S.y,onComplete = rotateMonkeyG4thirdS})
end

local function rotateMonkeyG4firstS()

monkeyG4S:play{ startFrame=1, endFrame=2, loop=1 }
monkeyG4S:scale(1.2,1.2)
sparrowOffset = 100;
branch8:play{ startFrame=1, endFrame=2, loop=1 }
t17S = timer.performWithDelay(animSpeed,monkeysmoveG4secS);
end

local function monkeysmoveG4S()
sparrowOffset = 50;
climbAudio();
tr17S = transition.to(monkeyG4S,{time = 100,delay = 100,x = monkeyG4S.x+50,y = monkeyG4S.y,onComplete = rotateMonkeyG4firstS})
end
--end fourth--
--]]

local function rotateMonkey3fifthS()
---monkeyG1S.alpha = 0;
monkeyG1S:play{ startFrame=1, endFrame=2, loop=1 }
t9S = timer.performWithDelay(200,secondRound);
branch6:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmove3fifthS()
transition.cancel(tr3S);
climbAudio();
monkeyG1S.x = inPos1S;
branch6.alpha = 1;
branch6R.alpha = 0;
tr4S = transition.to(monkeyG1S,{time = 100,delay = 0,x = monkeyG1S.x-650,y = monkeyG1S.y+50,onComplete = rotateMonkey3fifthS})
end

local function rotateMonkey3fourthS()
monkeyG1S:play{ startFrame=2, endFrame=2, loop=1 }

inPos1S = monkeyG1S.x;
--branch6.alpha = 0;
branch6R.alpha = 1;
monkeyG1S.x = branch6R.x;
monkeyG1S.x = monkeyG1S.x+10;
monkeyx = monkeyG1S;
--trans = tr3;
branchx = branch6R;
--rotateBranch();

 trans1S = transition.to(branchx,{time = 300,delay = 0,rotation=20})
 trans1S = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans1S = transition.to(branchx,{time = 400,delay = 600,rotation=16})
 trans1S = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans1S = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x-48,y = monkeyx.y})
 trans1S = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x+49,y = monkeyx.y})
 trans1S = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x-28,y = monkeyx.y})
 trans1S = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x+40,y = monkeyx.y})
 
t8S = timer.performWithDelay(animSpeed,monkeysmove3fifthS);
branch5:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmove3fourthS()
transition.cancel(tr2S);
climbAudio();
monkeyG1S.x = inPos1S;
branch5.alpha = 1;
branch5R.alpha = 0;
tr3S = transition.to(monkeyG1S,{time = 100,delay = 0,x = monkeyG1S.x-240,y = monkeyG1S.y+50,onComplete = rotateMonkey3fourthS})
end

local function rotateMonkey3thirdS()
monkeyG1S:play{ startFrame=2, endFrame=2, loop=1 }
inPos1S = monkeyG1S.x;
--branch5.alpha = 0;
branch5R.alpha = 1;
monkeyG1S.x = branch5R.x;
monkeyG1S.x = monkeyG1S.x;
monkeyx = monkeyG1S;
--trans = tr2;
branchx = branch5R;
--rotateBranch();
trans2S = transition.to(branchx,{time = 300,delay = 0,rotation=20})
 trans2S = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans2S = transition.to(branchx,{time = 400,delay = 600,rotation=16})
 trans2S = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans2S = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x-49,y = monkeyx.y})
 trans2S = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x+49,y = monkeyx.y})
 trans2S = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x-29,y = monkeyx.y})
 trans2S = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x+40,y = monkeyx.y})

t7S = timer.performWithDelay(animSpeed,monkeysmove3fourthS);
branch8:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmove3thirdS()
transition.cancel(tr1S);
climbAudio();
monkeyG1S.x = inPos1S;
branch8.alpha = 1;
branch8R.alpha = 0;
tr2S = transition.to(monkeyG1S,{time = 100,delay = 0,x = monkeyG1S.x-10,y = monkeyG1S.y+50,onComplete = rotateMonkey3thirdS})

end

local function rotateMonkey3secS()
sparrowOffset = 120;
monkeyG1S:scale(1.5,1.5)	
monkeyG1S:play{ startFrame=1, endFrame=1, loop=1 }

inPos1S = monkeyG1S.x;
--branch8.alpha = 0;
branch8R.alpha = 1;
monkeyG1S.x = branch8R.x;
monkeyG1S.x = monkeyG1S.x-100;
monkeyx = monkeyG1S;
--trans = tr1;
branchx = branch8R;
--rotateBranch();

trans3S = transition.to(branchx,{time = 300,delay = 0,rotation=20})
 trans3S = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans3S = transition.to(branchx,{time = 400,delay = 600,rotation=16})
 trans3S = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans3S = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x-49,y = monkeyx.y})
 trans3S = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x+49,y = monkeyx.y})
 trans3S = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x-29,y = monkeyx.y})
 trans3S = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x+40,y = monkeyx.y})
 
t6S = timer.performWithDelay(animSpeed,monkeysmove3thirdS);
branch4:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmove3secS()
monkeyG1S.alpha = 1;
print('sc',monkeyG1S.contentWidth);
print('sc',monkeyG1S.contentHeight);
transition.cancel(tr0S);
climbAudio();
branch4.alpha = 1;
branch4R.alpha = 0;
monkeyG1S.x = inPos1S;
tr1S = transition.to(monkeyG1S,{time =100,delay = 0,x = monkeyG1S.x-210,y = monkeyG1S.y,onComplete = rotateMonkey3secS})

end


local function rotateMonkey3S()
sparrowOffset = 100;
monkeyG1S:scale(1.2,1.2);
monkeyG1S:play{ startFrame=1, endFrame=2, loop=1 }
inPos1S = monkeyG1S.x;
--branch4.alpha = 0;
branch4R.alpha = 1;
monkeyG1S.x = branch4R.x;
monkeyG1S.x = monkeyG1S.x-5;
monkeyx = monkeyG1S;
--trans = tr0;
branchx = branch4R;
--rotateBranch();

 trans4S = transition.to(branchx,{time = 300,delay = 0,rotation=20})
 trans4S = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans4S = transition.to(branchx,{time = 400,delay = 600,rotation=16})
 trans4S = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans4S = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x-49,y = monkeyx.y})
 trans4S = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x+49,y = monkeyx.y})
 trans4S = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x-29,y = monkeyx.y})
 trans4S = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x+40,y = monkeyx.y})
t5S = timer.performWithDelay(animSpeed,monkeysmove3secS);
end

function monkeysmove3S()

branch3.alpha = 1;
sparrowOffset = 50;
climbAudio();
tr0S = transition.to(monkeyG1S,{time = 100,delay = 100,x = monkeyG1S.x-40,y = monkeyG1S.y,onComplete = rotateMonkey3S})

branch3:play{ startFrame=1, endFrame=2, loop=1 }
end
--first end--

--monkey 2nd --
local function rotateMonkey4fifthS()
monkeyG2S:play{ startFrame=2, endFrame=2, loop=1 }
t0S = timer.performWithDelay(200,secondRound);
end
function monkeysmove4fifthS()
transition.cancel(tr8S);
climbAudio();
branch1.alpha = 1;
branch1R.alpha = 0;
monkeyG2S.x = inPos2S;
tr9S = transition.to(monkeyG2S,{time = 100,delay = 0,x = monkeyG2S.x+800,y = monkeyG2S.y+100,onComplete = rotateMonkey4fifthS})

branch2:play{ startFrame=2, endFrame=1, loop=1 }
end

local function rotateMonkey4fourthS()
monkeyG2S:play{ startFrame=1, endFrame=1, loop=1 }

inPos2S = monkeyG2S.x;
--branch1.alpha = 0;
branch1R.alpha = 1;
monkeyG2S.x = branch1R.x;
monkeyG2S.x = monkeyG2S.x+100;
monkeyx = monkeyG2S;
--trans = tr8S;
branchx = branch1R;

trans5S = transition.to(branchx,{time = 300,delay = 0,rotation=-16})
 trans5S = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans5S = transition.to(branchx,{time = 400,delay = 600,rotation=-12})
 trans5S = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans5S = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x+20,y = monkeyx.y})
 trans5S = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x-30,y = monkeyx.y})
 trans5S = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x+8,y = monkeyx.y})
 trans5S = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x-42,y = monkeyx.y})
 
 
t4S = timer.performWithDelay(animSpeed,monkeysmove4fifthS);
branch5:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmove4fourthS()
transition.cancel(tr7S);
climbAudio();
monkeyG2S.x = inPos2S;
branch2.alpha = 1;
branch2R.alpha = 0;
tr8S = transition.to(monkeyG2S,{time = 100,delay = 0,x = monkeyG2S.x+240,y = monkeyG2S.y+50,onComplete = rotateMonkey4fourthS})
end


local function rotateMonkey4thirdS()
monkeyG2S:play{ startFrame=2, endFrame=2, loop=1 }

inPos2S = monkeyG2S.x;
--branch2.alpha = 0;
branch2R.alpha = 1;
monkeyG2S.x = branch2R.x;
monkeyG2S.x = monkeyG2S.x;
monkeyx = monkeyG2S;
--trans = tr7S;
branchx = branch2R;
--rotateBranch1();
trans6S = transition.to(branchx,{time = 300,delay = 0,rotation=-16})
 trans6S = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans6S = transition.to(branchx,{time = 400,delay = 600,rotation=-12})
 trans6S = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans6S = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x+20,y = monkeyx.y})
 trans6S = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x-30,y = monkeyx.y})
 trans6S = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x+8,y = monkeyx.y})
 trans6S = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x-42,y = monkeyx.y})
 
t3S = timer.performWithDelay(animSpeed,monkeysmove4fourthS);
end

function monkeysmove4thirdS()
transition.cancel(tr6S);
climbAudio();
monkeyG2S.x = inPos2S;
branch7.alpha = 1;
branch7R.alpha = 0;
tr7S = transition.to(monkeyG2S,{time = 100,delay = 0,x = monkeyG2S.x-20,y = monkeyG2S.y,onComplete = rotateMonkey4thirdS})

branch3:play{ startFrame=2, endFrame=1, loop=1 }
end


local function rotateMonkey4secS()
monkeyG2S:scale(1.2,1.2)
sparrowOffset = 100;
monkeyG2S:play{ startFrame=1, endFrame=1, loop=1 }

inPos2S = monkeyG2S.x;
--branch7.alpha = 0;
branch7R.alpha = 1;
monkeyG2S.x = branch7R.x;
monkeyG2S.x = monkeyG2S.x+70;
monkeyx = monkeyG2S;
--trans = tr6S;
branchx = branch7R;
--rotateBranch1();

trans7S = transition.to(branchx,{time = 300,delay = 0,rotation=-20})
 trans7S = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans7S = transition.to(branchx,{time = 400,delay = 600,rotation=-16})
 trans7S = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans7S = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x+51,y = monkeyx.y})
 trans7S = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x-49,y = monkeyx.y})
 trans7S = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x+31,y = monkeyx.y})
 trans7S = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x-39,y = monkeyx.y})
 
t2S = timer.performWithDelay(animSpeed,monkeysmove4thirdS);
end


function monkeysmove4secS()
transition.cancel(tr5S);
climbAudio();
monkeyG2S.x = inPos2S;
branch3.alpha = 1;
branch3R.alpha = 0;
tr6S = transition.to(monkeyG2S,{time = 100,delay = 0,x = monkeyG2S.x+205,y = monkeyG2S.y,onComplete = rotateMonkey4secS})

branch4:play{ startFrame=2, endFrame=1, loop=1 }
end


local function rotateMonkey4S()
monkeyG2S:scale(1.2,1.2)
sparrowOffset = 100;	
monkeyG2S:play{ startFrame=2, endFrame=2, loop=1 }

inPos2S = monkeyG2S.x;
--branch3.alpha = 0;
branch3R.alpha = 1;
monkeyG2S.x = branch3R.x;
monkeyG2S.x = monkeyG2S.x+5;
monkeyx = monkeyG2S;
--trans = tr5S;
branchx = branch3R;
--rotateBranch1();

trans8S = transition.to(branchx,{time = 300,delay = 0,rotation=-19})
 trans8S = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans8S = transition.to(branchx,{time = 400,delay = 600,rotation=-15})
 trans8S = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans8S = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x+49,y = monkeyx.y})
 trans8S = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x-51,y = monkeyx.y})
 trans8S = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x+28,y = monkeyx.y})
 trans8S = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x-43,y = monkeyx.y})
t1S = timer.performWithDelay(animSpeed,monkeysmove4secS);
end


function monkeysmove4S()

branch4.alpha = 1;
sparrowOffset = 50;
climbAudio();
tr5S = transition.to(monkeyG2S,{time = 100,delay = 100,x = monkeyG2S.x+35,y = monkeyG2S.y,onComplete = rotateMonkey4S})

branch5:play{ startFrame=1, endFrame=2, loop=1 }
end
--monkey 2nd end--

--third monkey -- 
local function rotateMonkeyG3sevS()
monkeyG3S:play{ startFrame=2, endFrame=2, loop=1 }
t16S = timer.performWithDelay(200,secondRound);
branch6:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmoveG3sixS()
transition.cancel(tr14S);
climbAudio();
monkeyG3S.x = inPos3S;
branch6.alpha = 1;
branch6R.alpha = 0;
tr15S = transition.to(monkeyG3S,{time = 100,delay = 0,x = monkeyG3S.x-600,y = monkeyG3S.y+50,onComplete = rotateMonkeyG3sevS})
end

local function rotateMonkeyG3sixS()

monkeyG3S:play{ startFrame=2, endFrame=2, loop=1 }
--monkeyG3:scale(1.2,1.2)	
inPos3S = monkeyG3S.x;
--branch6.alpha = 0;
branch6R.alpha = 1;
monkeyG3S.x = branch6R.x;
monkeyG3S.x = monkeyG3S.x-20;
monkeyx = monkeyG3S;
--trans = tr14S;
branchx = branch6R;
--rotateBranch();
trans9S = transition.to(branchx,{time = 300,delay = 0,rotation=20})
 trans9S = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans9S = transition.to(branchx,{time = 400,delay = 600,rotation=16})
 trans9S = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans9S = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x-49,y = monkeyx.y})
 trans9S = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x+49,y = monkeyx.y})
 trans9S = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x-29,y = monkeyx.y})
 trans9S = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x+40,y = monkeyx.y})
 
 
t15S = timer.performWithDelay(animSpeed,monkeysmoveG3sixS);
branch5:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmoveG3fivS()
transition.cancel(tr13S);
climbAudio();
monkeyG3S.x = inPos3S;
branch5.alpha = 1;
branch5R.alpha = 0;
tr14S = transition.to(monkeyG3S,{time = 100,delay = 0,x = monkeyG3S.x,y = monkeyG3S.y+45,onComplete = rotateMonkeyG3sixS})
end

local function rotateMonkeyG3fivS()
monkeyG3S:play{ startFrame=1, endFrame=1, loop=1 }
monkeyG3S:scale(1.9,1.9)
sparrowOffset = 140;

inPos3S = monkeyG3S.x;
--branch5.alpha = 0;
branch5R.alpha = 1;
monkeyG3S.x = branch5R.x;
monkeyG3S.x = monkeyG3S.x-55;
monkeyx = monkeyG3S;
--trans = tr13S;
branchx = branch5R;
--rotateBranch();
trans10S = transition.to(branchx,{time = 300,delay = 0,rotation=20})
 trans10S = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans10S = transition.to(branchx,{time = 400,delay = 600,rotation=16})
 trans10S = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans10S = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x-49,y = monkeyx.y})
 trans10S = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x+49,y = monkeyx.y})
 trans10S = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x-29,y = monkeyx.y})
 trans10S = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x+40,y = monkeyx.y})

t14S = timer.performWithDelay(animSpeed,monkeysmoveG3fivS);
branch8:play{ startFrame=2, endFrame=1, loop=1 }

end
function monkeysmoveG3fourS()
transition.cancel(tr12S);
climbAudio();
monkeyG3S.x = inPos3S;
branch8.alpha = 1;
branch8R.alpha = 0;
tr13S = transition.to(monkeyG3S,{time = 100,delay = 0,x = monkeyG3S.x-215,y = monkeyG3S.y-10,onComplete = rotateMonkeyG3fivS})
end

local function rotateMonkeyG3fourS()

monkeyG3S:play{ startFrame=2, endFrame=2, loop=1 }
--monkeyG3:scale(1.6,1.6)	
inPos3S = monkeyG3S.x;
--branch8.alpha = 0;
branch8R.alpha = 1;
monkeyG3S.x = branch8R.x;
monkeyG3S.x = monkeyG3S.x;
monkeyx = monkeyG3S;
--trans = tr12S;
branchx = branch8R;
--rotateBranch();

trans11S = transition.to(branchx,{time = 300,delay = 0,rotation=20})
 trans11S = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans11S = transition.to(branchx,{time = 400,delay = 600,rotation=16})
 trans11S = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans11S = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x-49,y = monkeyx.y})
 trans11S = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x+49,y = monkeyx.y})
 trans11S = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x-29,y = monkeyx.y})
 trans11S = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x+40,y = monkeyx.y})
 

t13S = timer.performWithDelay(animSpeed,monkeysmoveG3fourS);
branch4:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmoveG3thirdS()
transition.cancel(tr11S);
climbAudio();
monkeyG3S.x = inPos3S;
branch4.alpha = 1;
branch4R.alpha = 0;
tr12S = transition.to(monkeyG3S,{time =100,delay = 0,x = monkeyG3S.x-50,y = monkeyG3S.y-20,onComplete = rotateMonkeyG3fourS})
end


local function rotateMonkeyG3thirdS()
monkeyG3S:play{ startFrame=1, endFrame=1, loop=1 }
t12S = timer.performWithDelay(animSpeed,monkeysmoveG3thirdS);
inPos3S = monkeyG3S.x;
--branch4.alpha = 0;
branch4R.alpha = 1;
monkeyG3S.x = branch4R.x;
monkeyG3S.x = monkeyG3S.x-80;
monkeyx = monkeyG3S;
--trans = tr11S;
branchx = branch4R;
--rotateBranch();

trans12S = transition.to(branchx,{time = 300,delay = 0,rotation=20})
 trans12S = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans12S = transition.to(branchx,{time = 400,delay = 600,rotation=16})
 trans12S = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans12S = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x-49,y = monkeyx.y})
 trans12S = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x+49,y = monkeyx.y})
 trans12S = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x-29,y = monkeyx.y})
 trans12S = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x+48,y = monkeyx.y})
 

branch3:play{ startFrame=2, endFrame=1, loop=1 }
end


function monkeysmoveG3secS()
transition.cancel(tr10S);
climbAudio();
monkeyG3S.x = inPos3S;
branch3.alpha = 1;
branch3R.alpha = 0;
tr11S = transition.to(monkeyG3S,{time =100,delay = 0,x = monkeyG3S.x-200,y = monkeyG3S.y-30,onComplete = rotateMonkeyG3thirdS})
end

local function rotateMonkeyG3firstS()

monkeyG3S:play{ startFrame=2, endFrame=2, loop=1 }
monkeyG3S:scale(1.2,1.2)	
sparrowOffset = 100;
--branch7S:play{ startFrame=1, endFrame=2, loop=1 }
branch8S:play{ startFrame=1, endFrame=2, loop=1 }
inPos3S = monkeyG3S.x;
--branch3.alpha = 0;
branch3R.alpha = 1;
monkeyG3S.x = branch3R.x;
monkeyG3S.x = monkeyG3S.x-20;
monkeyx = monkeyG3S;
--trans = tr10S;
branchx = branch3R;
--rotateBranch();

trans13S = transition.to(branchx,{time = 300,delay = 0,rotation=20})
 trans13S = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans13S = transition.to(branchx,{time = 400,delay = 600,rotation=16})
 trans13S = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans13S = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x-56,y = monkeyx.y})
 trans13S = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x+49,y = monkeyx.y})
 trans13S = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x-41,y = monkeyx.y})
 trans13S = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x+41,y = monkeyx.y})
 

t10S = timer.performWithDelay(animSpeed,monkeysmoveG3secS);
end


local function monkeysmoveG3S()

branch8.alpha = 1;
climbAudio();
tr10S = transition.to(monkeyG3,{time = 100,delay = 100,x = monkeyG3.x-30,y = monkeyG3.y-50,onComplete = rotateMonkeyG3first})

end

--third monkey end--

--fourth monkey --

local function rotateMonkeyG4sevS()
monkeyG4S:play{ startFrame=2, endFrame=2, loop=1 }
t22S = timer.performWithDelay(200,secondRound);
branch1:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmoveG4sixS()
transition.cancel(tr21S);
climbAudio();
monkeyG4S.x = inPos4S;
branch1.alpha = 1;
branch1R.alpha = 0;
tr22S = transition.to(monkeyG4S,{time = 100,delay = 0,x = monkeyG4S.x+600,y = monkeyG4S.y+50,onComplete = rotateMonkeyG4sevS})
end

local function rotateMonkeyG4sixS()

monkeyG4S:play{ startFrame=2, endFrame=2, loop=1 }
--monkeyG3:scale(1.2,1.2)	
inPos4S = monkeyG4S.x;
--branch1.alpha = 0;
branch1R.alpha = 1;
monkeyG4S.x = branch1R.x;
monkeyG4S.x = monkeyG4S.x;
monkeyx = monkeyG4S;
--trans = tr21S;
branchx = branch1R;
--rotateBranch1();
trans14S = transition.to(branchx,{time = 300,delay = 0,rotation=-19})
 trans14S = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans14S = transition.to(branchx,{time = 400,delay = 600,rotation=-15})
 trans14S = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans14S = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x+49,y = monkeyx.y})
 trans14S = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x-51,y = monkeyx.y})
 trans14S = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x+28,y = monkeyx.y})
 trans14S = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x-43,y = monkeyx.y})
 
 
t21S = timer.performWithDelay(animSpeed,monkeysmoveG4sixS);
branch2:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmoveG4fivS()
transition.cancel(tr20S);
climbAudio();
monkeyG4S.x = inPos4S;
branch2.alpha = 1;
branch2R.alpha = 0;
tr21S = transition.to(monkeyG4S,{time = 100,delay = 0,x = monkeyG4S.x+20,y = monkeyG4S.y,onComplete = rotateMonkeyG4sixS})
end

local function rotateMonkeyG4fivS()
monkeyG4S:play{ startFrame=1, endFrame=1, loop=1 }
monkeyG4S:scale(1.1,1.1)
sparrowOffset = 90;

inPos4S = monkeyG4S.x;
--branch2.alpha = 0;
branch2R.alpha = 1;
monkeyG4S.x = branch2R.x;
monkeyG4S.x = monkeyG4S.x+80;
monkeyx = monkeyG4S;
--trans = tr20S;
branchx = branch2R;
--rotateBranch1();
trans15S = transition.to(branchx,{time = 300,delay = 0,rotation=-19})
 trans15S = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans15S = transition.to(branchx,{time = 400,delay = 600,rotation=-15})
 trans15S = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans15S = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x+49,y = monkeyx.y})
 trans15S = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x-51,y = monkeyx.y})
 trans15S = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x+28,y = monkeyx.y})
 trans15S = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x-43,y = monkeyx.y})
 
t20S = timer.performWithDelay(animSpeed,monkeysmoveG4fivS);
branch7:play{ startFrame=2, endFrame=1, loop=1 }

end
function monkeysmoveG4fourS()
transition.cancel(tr19S);
climbAudio();
monkeyG4S.x = inPos4S;
branch7.alpha = 1;
branch7R.alpha = 0;
tr20S = transition.to(monkeyG4S,{time = 100,delay = 0,x = monkeyG4S.x+230,y = monkeyG4S.y-50,onComplete = rotateMonkeyG4fivS})
end

local function rotateMonkeyG4fourS()

monkeyG4S:play{ startFrame=2, endFrame=2, loop=1 }
monkeyG4S:scale(1.4,1.4)	
sparrowOffset = 110;

inPos4S = monkeyG4S.x;
--branch7.alpha = 0;
branch7R.alpha = 1;
monkeyG4S.x = branch7R.x;
monkeyG4S.x = monkeyG4S.x+5;
monkeyx = monkeyG4S;
--trans = tr19S;
branchx = branch7R;
--rotateBranch1();

trans16S = transition.to(branchx,{time = 300,delay = 0,rotation=-19})
 trans16S = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans16S = transition.to(branchx,{time = 400,delay = 600,rotation=-15})
 trans16S = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans16S = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x+49,y = monkeyx.y})
 trans16S = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x-51,y = monkeyx.y})
 trans16S = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x+28,y = monkeyx.y})
 trans16S = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x-44,y = monkeyx.y})
 
t19S = timer.performWithDelay(animSpeed,monkeysmoveG4fourS);
branch3:play{ startFrame=2, endFrame=1, loop=1 }
end

function monkeysmoveG4thirdS()
transition.cancel(tr18S);
climbAudio();
monkeyG4S.x = inPos4S;
branch3.alpha = 1;
branch3R.alpha = 0;
tr19 = transition.to(monkeyG4S,{time =100,delay = 0,x = monkeyG4S.x-20,y = monkeyG4S.y+50,onComplete = rotateMonkeyG4fourS})
end

local function rotateMonkeyG4thirdS()
monkeyG4S:play{ startFrame=1, endFrame=1, loop=1 }

inPos4S = monkeyG4S.x;
--branch3.alpha = 0;
branch3R.alpha = 1;
monkeyG4S.x = branch3R.x;
monkeyG4S.x = monkeyG4S.x+80;
monkeyx = monkeyG4S;
--trans = tr18S;
branchx = branch3R;
--rotateBranch1();

 trans17S = transition.to(branchx,{time = 300,delay = 0,rotation=-19})
 trans17S = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans17S = transition.to(branchx,{time = 400,delay = 600,rotation=-15})
 trans17S = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans17S = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x+50,y = monkeyx.y})
 trans17S = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x-54,y = monkeyx.y})
 trans17S = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x+35,y = monkeyx.y})
 trans17S = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x-44,y = monkeyx.y})
 
 
t18S = timer.performWithDelay(animSpeed,monkeysmoveG4thirdS);

branch4:play{ startFrame=2, endFrame=1, loop=1 }
end


function monkeysmoveG4secS()
transition.cancel(tr17S);
climbAudio();
monkeyG4S.x = inPos4S;
branch8.alpha = 1;
branch8R.alpha = 0;
tr18S = transition.to(monkeyG4S,{time =100,delay = 0,x = monkeyG4S.x+218,y = monkeyG4S.y,onComplete = rotateMonkeyG4thirdS})
end

local function rotateMonkeyG4firstS()

monkeyG4S:play{ startFrame=2, endFrame=2, loop=1 }
monkeyG4S:scale(1.2,1.2)
sparrowOffset = 100;
branch8:play{ startFrame=1, endFrame=2, loop=1 }

inPos4S = monkeyG4S.x;
--branch8.alpha = 0;
branch8R.alpha = 1;
monkeyG4S.x = branch8R.x;
monkeyG4S.x = monkeyG4S.x+5;
monkeyx = monkeyG4S;
--trans = tr17S;
branchx = branch8R;
--rotateBranch1();

 trans18S = transition.to(branchx,{time = 300,delay = 0,rotation=-19})
 trans18S = transition.to(branchx,{time = 300,delay = 300,rotation=0})
 trans18S = transition.to(branchx,{time = 400,delay = 600,rotation=-15})
 trans18S = transition.to(branchx,{time = 400,delay = 1000,rotation=0})
 --monkeyx.x = branchx.x;
 trans18S = transition.to(monkeyx,{time = 300,delay = 0,x = monkeyx.x+55,y = monkeyx.y})
 trans18S = transition.to(monkeyx,{time = 300,delay = 300,x = monkeyx.x-51,y = monkeyx.y})
 trans18S = transition.to(monkeyx,{time = 400,delay = 600,x = monkeyx.x+35,y = monkeyx.y})
 trans18S = transition.to(monkeyx,{time = 400,delay = 1000,x = monkeyx.x-43,y = monkeyx.y})
 
t17S = timer.performWithDelay(animSpeed,monkeysmoveG4secS);
end

local function monkeysmoveG4S()

branch8.alpha = 1;

climbAudio();
tr17S = transition.to(monkeyG4S,{time = 100,delay = 100,x = monkeyG4S.x+50,y = monkeyG4S.y,onComplete = rotateMonkeyG4firstS})
end



local function addEventmonkeyG1()
monkeyG1:addEventListener("tap",shoot);
end

local function addEventmonkeyG2()
monkeyG2:addEventListener("tap",shoot);
end

local function addEventmonkeyG3()
monkeyG3:addEventListener("tap",shoot);

end

local function addEventmonkeyG4()
monkeyG4:addEventListener("tap",shoot);
end

local function addEventmonkeyG1S()
monkeyG1S:addEventListener("tap",shoot);
end
local function addEventmonkeyG2S()
monkeyG2S:addEventListener("tap",shoot);
end
local function addEventmonkeyG3S()
monkeyG3S:addEventListener("tap",shoot);
end
local function addEventmonkeyG4S()
monkeyG4S:addEventListener("tap",shoot);
end

local function monkeyFirst()
if monkeyG1 ~= nil then
monkeyG1:removeSelf();
monkeyG1 = nil;
end
monkeyG1 = movieclip.newAnim(imageTablem3);
monkeyG1:scale(0.4,0.4)	
monkeyG1.tag = 1;
gameGroup:insert(monkeyG1);
--monkeyG1:addEventListener("tap",shoot);
monkeyG1.x = branch3.x-20;monkeyG1.y = branch3.y-430;
monkeyG1:play({startFrame = 1,endFrame = 1,loop = 1})
monkeyG1.y = monkeyG1.y+370;
monkeyG1.alpha = 1;
branch3.alpha = 1;
 random = math.random(8)
monkeysmove3();

timer.performWithDelay(100,addEventmonkeyG1);

leaves:toFront(monkeyG1);
banana:toFront(leaves);
cross:toFront(leaves);
scoreTxt:toFront(leaves);
btnMusicOff:toFront(leaves);
btnMusicOn:toFront(leaves);
home:toFront(leaves);
slingShot:toFront(leaves);
stone:toFront();
end

local function monkeyColorFirst()
if monkeyG1 ~= nil then
monkeyG1:removeSelf();
monkeyG1 = nil;
end
imageTablemC1 = {}
for i = 1,8 do
  table.insert( imageTablemC1, "images/game/colorMonkey/blue/b" .. i .. ".png" )
end
monkeyG1 = movieclip.newAnim(imageTablemC1);
monkeyG1.tag = 100;
 random = math.random(8)
print('tag',monkeyG1.tag);
monkeyG1:scale(0.4,0.4)	
gameGroup:insert(monkeyG1);
--monkeyG1:addEventListener("tap",shoot);
monkeyG1.x = branch3.x-20;monkeyG1.y = branch3.y-430;
monkeyG1:play({startFrame = 1,endFrame = 1,loop = 1})
monkeyG1.y = monkeyG1.y+370;
branch3.alpha = 1;
monkeyG1.alpha = 0.99;
monkeysmove3();
timer.performWithDelay(100,addEventmonkeyG1);

leaves:toFront(monkeyG1);
banana:toFront(leaves);
cross:toFront(leaves);
scoreTxt:toFront(leaves);
btnMusicOff:toFront(leaves);
btnMusicOn:toFront(leaves);
home:toFront(leaves);
slingShot:toFront(leaves);
stone:toFront();
end

--monkeyColorFirst();

local function monkeyColorSecond()
if monkeyG2 ~= nil then
monkeyG2:removeSelf();
monkeyG2 = nil;
end
 random = math.random(8)
imageTablemC2 = {}
for i = 1,14 do
  table.insert( imageTablemC2, "images/game/colorMonkey/brown/br" .. i .. ".png" )
end
monkeyG2 = movieclip.newAnim(imageTablemC2);
monkeyG2.tag = 100;
monkeyG2.xScale = -1 
monkeyG2.alpha = 0.99;
monkeyG2:scale(0.6,0.6)	
monkeyG2.x = branch4.x+80;monkeyG2.y = branch4.y-430;
monkeyG2.y = monkeyG2.y+400;
monkeyG2:play({startFrame = 1,endFrame = 1,loop = 1})
--monkeyG2:addEventListener("tap",shoot);
branch4.alpha = 1;
monkeysmove4();

timer.performWithDelay(100,addEventmonkeyG2);

leaves:toFront(monkeyG2);
banana:toFront(leaves);
cross:toFront(leaves);
scoreTxt:toFront(leaves);
btnMusicOff:toFront(leaves);
btnMusicOn:toFront(leaves);
home:toFront(leaves);
slingShot:toFront(leaves);
stone:toFront();
end

local function monkeyColorThird()
if monkeyG3 ~= nil then
monkeyG3:removeSelf();
monkeyG3 = nil;
end
imageTablemC3 = {}
for i = 1,14 do
  table.insert( imageTablemC3, "images/game/colorMonkey/purple/p" .. i .. ".png" )
end
 random = math.random(8)
monkeyG3 = movieclip.newAnim(imageTablemC3);
monkeyG3.tag = 100;
monkeyG3.alpha = 0.99;
monkeyG3.width = 73.6;
monkeyG3.height = 90;
gameGroup:insert(monkeyG3);

monkeyG3.x = branch7.x;monkeyG3.y = branch7.y-430;
monkeyG3.y = monkeyG3.y+400;
monkeyG3:play({startFrame = 1,endFrame = 1,loop = 1})
--monkeyG3:addEventListener("tap",shoot);
branch7.alpha = 1;
monkeysmoveG3();

timer.performWithDelay(100,addEventmonkeyG3);

leaves:toFront(monkeyG3);
banana:toFront(leaves);
cross:toFront(leaves);
scoreTxt:toFront(leaves);
btnMusicOff:toFront(leaves);
btnMusicOn:toFront(leaves);
home:toFront(leaves);
slingShot:toFront(leaves);
stone:toFront();
end

local function monkeyColorFourth()
if monkeyG4 ~= nil then
monkeyG4:removeSelf();
monkeyG4 = nil;
end
imageTablemC4 = {}
for i = 1,14 do
  table.insert( imageTablemC4, "images/game/colorMonkey/green/gr" .. i .. ".png" )
end
 random = math.random(8)
monkeyG4 = movieclip.newAnim(imageTablemC4);
monkeyG4.tag = 100;
monkeyG4.xScale = -1 
monkeyG4.alpha = 0.99;
monkeyG4.width = 92;
monkeyG4.height = 112.5;
gameGroup:insert(monkeyG4);

monkeyG4.x = branch8.x+65;monkeyG4.y = branch8.y-430;
monkeyG4.y = monkeyG4.y+400;

--monkeyG4:addEventListener("tap",shoot);
branch8.alpha = 1;
monkeysmoveG4();

timer.performWithDelay(100,addEventmonkeyG4);

leaves:toFront(monkeyG4);
banana:toFront(leaves);
cross:toFront(leaves);
scoreTxt:toFront(leaves);
btnMusicOff:toFront(leaves);
btnMusicOn:toFront(leaves);
home:toFront(leaves);
slingShot:toFront(leaves);
stone:toFront();
end

local function monkeyColorFifth()
if monkeyG4 ~= nil then
monkeyG4:removeSelf();
monkeyG4 = nil;
end
 random = math.random(8)
imageTablemC4 = {}
for i = 1,14 do
  table.insert( imageTablemC4, "images/game/colorMonkey/gray/gra" .. i .. ".png" )
end
monkeyG4 = movieclip.newAnim(imageTablemC4);
monkeyG4.tag = 100;
monkeyG4.xScale = -1 
monkeyG4.alpha = 0.99;
monkeyG4.width = 92;
monkeyG4.height = 112.5;
gameGroup:insert(monkeyG4);

monkeyG4.x = branch8.x+65;monkeyG4.y = branch8.y-430;
monkeyG4.y = monkeyG4.y+400;

--monkeyG4:addEventListener("tap",shoot);
branch8.alpha = 1;
monkeysmoveG4();

timer.performWithDelay(100,addEventmonkeyG4);

leaves:toFront(monkeyG4);
banana:toFront(leaves);
cross:toFront(leaves);
scoreTxt:toFront(leaves);
btnMusicOff:toFront(leaves);
btnMusicOn:toFront(leaves);
home:toFront(leaves);
slingShot:toFront(leaves);
stone:toFront();
end

local function monkeyColorGold()
if monkeyG1 ~= nil then
monkeyG1:removeSelf();
monkeyG1 = nil;
end
 random = math.random(8)
imageTablemC1 = {}
for i = 1,14 do  --changeit
  table.insert( imageTablemC1, "images/game/colorMonkey/golden/g" .. i .. ".png" )
end
monkeyG1 = movieclip.newAnim(imageTablemC1);
monkeyG1.tag = 101;
monkeyG1:scale(0.4,0.4)	
gameGroup:insert(monkeyG1);
--monkeyG1:addEventListener("tap",shoot);
monkeyG1.x = branch3.x-20;monkeyG1.y = branch3.y-430;
monkeyG1:play({startFrame = 1,endFrame = 1,loop = 1})
monkeyG1.y = monkeyG1.y+370;
monkeyG1.alpha = 0.999;
branch3.alpha = 1;
monkeysmove3();
timer.performWithDelay(100,addEventmonkeyG1);

leaves:toFront(monkeyG1);
banana:toFront(leaves);
cross:toFront(leaves);
scoreTxt:toFront(leaves);
btnMusicOff:toFront(leaves);
btnMusicOn:toFront(leaves);
home:toFront(leaves);
slingShot:toFront(leaves);
stone:toFront();
end

local function monkeySecond()
if monkeyG2 ~= nil then
monkeyG2:removeSelf();
monkeyG2 = nil;
end
 random = math.random(8)
monkeyG2 = movieclip.newAnim(imageTablem4);
monkeyG2.xScale = -1 
monkeyG2.alpha = 1;
monkeyG2.tag = 1;
--monkeyG2:scale(0.6,0.6)
monkeyG2.width = 110.4;
monkeyG2.height = 135;	
monkeyG2.x = branch4.x+80;monkeyG2.y = branch4.y-430;
monkeyG2.y = monkeyG2.y+400;
monkeyG2:play({startFrame = 1,endFrame = 1,loop = 1})

--monkeyG2:addEventListener("tap",shoot);
branch4.alpha = 1;
monkeysmove4();

timer.performWithDelay(100,addEventmonkeyG2);

leaves:toFront(monkeyG2);
banana:toFront(leaves);
cross:toFront(leaves);
scoreTxt:toFront(leaves);
btnMusicOff:toFront(leaves);
btnMusicOn:toFront(leaves);
home:toFront(leaves);
slingShot:toFront(leaves);
stone:toFront();
end

local function monkeyThird()
if monkeyG3 ~= nil then
monkeyG3:removeSelf();
monkeyG3 = nil;
end
monkeyG3 = movieclip.newAnim(imageTablemG3);
monkeyG3.alpha = 1;
monkeyG3.tag = 1;
monkeyG3.width = 73.6;
monkeyG3.height = 90;
gameGroup:insert(monkeyG3);
 random = math.random(8)
monkeyG3.x = branch7.x;monkeyG3.y = branch7.y-430;
monkeyG3.y = monkeyG3.y+400;
monkeyG3:play({startFrame = 1,endFrame = 1,loop = 1})
--monkeyG3:addEventListener("tap",shoot);
branch7.alpha = 1;
monkeysmoveG3();
timer.performWithDelay(100,addEventmonkeyG3);

leaves:toFront(monkeyG3);
banana:toFront(leaves);
cross:toFront(leaves);
scoreTxt:toFront(leaves);
btnMusicOff:toFront(leaves);
btnMusicOn:toFront(leaves);
home:toFront(leaves);
slingShot:toFront(leaves);
stone:toFront();
end

local function monkeyFourth()
if monkeyG4 ~= nil then
monkeyG4:removeSelf();
monkeyG4 = nil;
end 
random = math.random(8)

monkeyG4 = movieclip.newAnim(imageTablemG4);
monkeyG4.xScale = -1 
monkeyG4.tag = 1;
monkeyG4.alpha = 1;
monkeyG4.width = 92;
monkeyG4.height = 112.5;
gameGroup:insert(monkeyG4);

monkeyG4.x = branch8.x+65;monkeyG4.y = branch8.y-430;
monkeyG4.y = monkeyG4.y+400;

--monkeyG4:addEventListener("tap",shoot);
branch8.alpha = 1;
monkeysmoveG4();
timer.performWithDelay(100,addEventmonkeyG4);

leaves:toFront(monkeyG4);
banana:toFront(leaves);
cross:toFront(leaves);
scoreTxt:toFront(leaves);
btnMusicOff:toFront(leaves);
btnMusicOn:toFront(leaves);
home:toFront(leaves);
slingShot:toFront(leaves);
stone:toFront();
end


local function monkeyFirstS()
if monkeyG1S ~= nil then
monkeyG1S:removeSelf();
monkeyG1S = nil;
end
monkeyG1S = movieclip.newAnim(imageTablem3);
monkeyG1S:scale(0.4,0.4)	
monkeyG1S.tag = 1;
gameGroup:insert(monkeyG1S);
--monkeyG1:addEventListener("tap",shoot);
monkeyG1S.x = branch3.x-20;monkeyG1S.y = branch3.y-430;
monkeyG1S:play({startFrame = 1,endFrame = 1,loop = 1})
monkeyG1S.y = monkeyG1S.y+370;
monkeyG1S.alpha = 1;
branch3.alpha = 1;
 random = math.random(8)
monkeysmove3S();

timer.performWithDelay(100,addEventmonkeyG1S);

leaves:toFront(monkeyG1S);
banana:toFront(leaves);
cross:toFront(leaves);
scoreTxt:toFront(leaves);
btnMusicOff:toFront(leaves);
btnMusicOn:toFront(leaves);
home:toFront(leaves);
slingShot:toFront(leaves);
stone:toFront();
end


local function monkeySecondS()
if monkeyG2S ~= nil then
monkeyG2S:removeSelf();
monkeyG2S = nil;
end

monkeyG2S = movieclip.newAnim(imageTablem4S);
monkeyG2S.xScale = -1 
monkeyG2S.tag = 1;
monkeyG2S.alpha = 1;
monkeyG2S:scale(0.6,0.6)	
monkeyG2S.x = branch4.x+80;monkeyG2S.y = branch4.y-430;
monkeyG2S.y = monkeyG2S.y+400;
monkeyG2S:play({startFrame = 1,endFrame = 1,loop = 1})

--monkeyG2S:addEventListener("tap",shoot);
branch4.alpha = 1;
monkeysmove4S();
timer.performWithDelay(100,addEventmonkeyG2S);

leaves:toFront(monkeyG2S);
banana:toFront(leaves);
cross:toFront(leaves);
scoreTxt:toFront(leaves);
btnMusicOff:toFront(leaves);
btnMusicOn:toFront(leaves);
home:toFront(leaves);
slingShot:toFront(leaves);
stone:toFront();
end

local function monkeyThirdS()
if monkeyG3S ~= nil then
monkeyG3S:removeSelf();
monkeyG3S = nil;
end
monkeyG3S = movieclip.newAnim(imageTablemG3S);
monkeyG3S.alpha = 1;
monkeyG3S.tag = 1;
monkeyG3S.width = 73.6;
monkeyG3S.height = 90;
gameGroup:insert(monkeyG3S);

monkeyG3S.x = branch7.x;monkeyG3S.y = branch7.y-430;
monkeyG3S.y = monkeyG3S.y+400;
monkeyG3S:play({startFrame = 1,endFrame = 1,loop = 1})
--monkeyG3S:addEventListener("tap",shoot);
branch7.alpha = 1;
monkeysmoveG3S();
timer.performWithDelay(100,addEventmonkeyG3S);

leaves:toFront(monkeyG3S);
banana:toFront(leaves);
cross:toFront(leaves);
scoreTxt:toFront(leaves);
btnMusicOff:toFront(leaves);
btnMusicOn:toFront(leaves);
home:toFront(leaves);
slingShot:toFront(leaves);
stone:toFront();
end

local function monkeyFourthS()
if monkeyG4S ~= nil then
monkeyG4S:removeSelf();
monkeyG4S = nil;
end

monkeyG4S = movieclip.newAnim(imageTablemG4S);
monkeyG4S.xScale = -1 
monkeyG4S.tag = 1;
monkeyG4S.alpha = 1;
monkeyG4S.width = 92;
monkeyG4S.height = 112.5;
gameGroup:insert(monkeyG4S);

monkeyG4S.x = branch8.x+65;monkeyG4S.y = branch8.y-430;
monkeyG4S.y = monkeyG4S.y+400;

--monkeyG4S:addEventListener("tap",shoot);
branch8.alpha = 1;
monkeysmoveG4S();
timer.performWithDelay(100,addEventmonkeyG4S);

leaves:toFront(monkeyG4S);
banana:toFront(leaves);
cross:toFront(leaves);
scoreTxt:toFront(leaves);
btnMusicOff:toFront(leaves);
btnMusicOn:toFront(leaves);
home:toFront(leaves);
slingShot:toFront(leaves);
stone:toFront();
end

count = 1
--monkeysCount = 9958
--monkeysCount = 243;
--monkeysCount = 98;


local function forceRemove()
--count = count + 1;
secondRound();
end
local function monkeysRemain()
monkeyG1S.alpha = 0;monkeyG2S.alpha = 0;monkeyG3S.alpha = 0;monkeyG4S.alpha = 0;
monkeyG1.alpha = 0;monkeyG2.alpha = 0;monkeyG3.alpha = 0;monkeyG4.alpha = 0;
end

--falling through branches
function monkeysAppear()

 print(random,'random');
 
toungueOut:play({startFrame = 1,endFrame = 1,loop = 1})
toungueOut.alpha = 0;
--monkey animation
monkeyG1.x = branch3.x-20;monkeyG1.y = branch3.y-430;
monkeyG2.x = branch4.x+80;monkeyG2.y = branch4.y-430;
monkeyG3.x = branch7.x;monkeyG3.y = branch7.y-430;
monkeyG4.x = branch8.x+65;monkeyG4.y = branch8.y-430;

monkeyG1S.x = branch3.x-20;monkeyG1S.y = branch3.y-430;
monkeyG2S.x = branch4.x+80;monkeyG2S.y = branch4.y-430;
monkeyG3S.x = branch7.x;monkeyG3S.y = branch7.y-430;
monkeyG4S.x = branch8.x+65;monkeyG4S.y = branch8.y-430;

monkeyG1.alpha = 0;
monkeyG2.alpha = 0;
monkeyG3.alpha = 0;
monkeyG4.alpha = 0;

branch1R.alpha = 0;
branch2R.alpha = 0;
branch3R.alpha = 0;
branch4R.alpha = 0;
branch5R.alpha = 0;
branch6R.alpha = 0;
branch7R.alpha = 0;
branch8R.alpha = 0;

branch1R.rotation = 0;
branch2R.rotation = 0;
branch3R.rotation = 0;
branch4R.rotation = 0;
branch5R.rotation = 0;
branch6R.rotation = 0;
branch7R.rotation = 0;
branch8R.rotation = 0;


branch1.alpha = 1;
branch2.alpha = 1;
branch3.alpha = 1;
branch4.alpha = 1;
branch5.alpha = 1;
branch6.alpha = 1;
branch7.alpha = 1;
branch8.alpha = 1;

monkeyG1S.alpha = 0;
monkeyG2S.alpha = 0;
monkeyG3S.alpha = 0;
monkeyG4S.alpha = 0;

stone.alpha = 1;
stone.x = 522.5;
stone.y = 665;

--timer.performWithDelay(10000,monkeysRemain);

branch1:play({startFrame = 1,endFrame = 1,loop = 1})
branch2:play({startFrame = 1,endFrame = 1,loop = 1})
branch3:play({startFrame = 1,endFrame = 1,loop = 1})
branch4:play({startFrame = 1,endFrame = 1,loop = 1})
branch5:play({startFrame = 1,endFrame = 1,loop = 1})
branch6:play({startFrame = 1,endFrame = 1,loop = 1})
branch7:play({startFrame = 1,endFrame = 1,loop = 1})
branch8:play({startFrame = 1,endFrame = 1,loop = 1})

if count == 1 then
monkeyG1.alpha = 1;
monkeyG1.y = monkeyG1.y+370;
monkeyG1:play({startFrame = 1,endFrame = 1,loop = 1})
monkeysCount = monkeysCount + 1;
numberofMonkeys = 1;

monkeysmove3();

timer.performWithDelay(100,addEventmonkeyG1);

end
if count == 2 then
monkeyG2.alpha = 1;
monkeyG2.y = monkeyG2.y+400;
monkeyG2:play({startFrame = 1,endFrame = 1,loop = 1})
monkeysCount = monkeysCount + 1;
numberofMonkeys = 1;
monkeysmove4();

timer.performWithDelay(100,addEventmonkeyG2);
end
if count == 3 then
monkeyG3.alpha = 1;
monkeyG3.y = monkeyG3.y+400;
monkeyG3:play({startFrame = 1,endFrame = 1,loop = 1})
numberofMonkeys = 1;
monkeysCount = monkeysCount + 1;
monkeysmoveG3();

timer.performWithDelay(100,addEventmonkeyG3);

end
if count == 4 then
monkeyG4.alpha = 1;
monkeyG4.y = monkeyG4.y+400;
monkeyG4:play({startFrame = 1,endFrame = 1,loop = 1})
monkeysCount = monkeysCount + 1;
numberofMonkeys = 1;

monkeysmoveG4();
timer.performWithDelay(100,addEventmonkeyG4);
end

if count == 5 then
numberofMonkeys = 1;
monkeysCount = monkeysCount + 1;
monkeyFirst();
end 

if count == 6 then
numberofMonkeys = 1;
monkeysCount = monkeysCount + 1;
monkeyFourth();
end

if count == 7 then
numberofMonkeys = 1;
monkeysCount = monkeysCount + 1;
monkeySecond();
end
if count == 8 then
numberofMonkeys = 1;
monkeysCount = monkeysCount + 1;
monkeyThird();
end
if count == 9 then
numberofMonkeys = 1;
monkeysCount = monkeysCount + 1;
monkeyFirst();
end 
if count == 10 then
numberofMonkeys = 1;
monkeysCount = monkeysCount + 1;
monkeyFourth();
end
if count == 11 or count == 15 or count == 19 then
numberofMonkeys = 2;
monkeysCount = monkeysCount + 2;
monkeyFirst();
monkeyThird();
end
if count == 12 or count == 16 or count == 22 or count == 25  or count == 26 then
numberofMonkeys = 2;
monkeysCount = monkeysCount + 2;
monkeyThird();
monkeyFourth();
end
if count == 13 or count == 18 or count == 20 or count == 24 or count == 28 then
numberofMonkeys = 2;
monkeysCount = monkeysCount + 2;
monkeyFirst();
monkeyFourth();
end
if count == 14 or count == 17 or count == 21 or count == 23 or count == 27 then
numberofMonkeys = 2;
monkeysCount = monkeysCount + 2;
monkeyThird();
monkeySecond();
end

if count == 29 then
numberofMonkeys = 3;
monkeysCount = monkeysCount + 3;
monkeyFirst();
monkeySecond();
monkeyThird();
end

--50th MONKEY anim--
if count == 30 then
numberofMonkeys = 3;
monkeysCount = monkeysCount + 3;
monkeyColorFirst();
monkeySecond();
monkeyThird();
end


if count == 31 or count == 33 or count == 35 or count == 37 then
numberofMonkeys = 3;
monkeysCount = monkeysCount + 3;
monkeyFirst();
monkeyFourth();
monkeyThird();
end

if count == 32 or count == 34 or count == 36 or count == 38 then
numberofMonkeys = 3;
monkeysCount = monkeysCount + 3;
monkeyFirst();
monkeyFourth();
monkeyThird();
end


if count == 39 or count == 41 then
numberofMonkeys = 4;
monkeysCount = monkeysCount + 4;
monkeyFirst();
monkeyFourth();
monkeyThird();
monkeySecond();
end

local function callfunc1()
monkeyG2S.alpha = 1;
monkeyG2S.x = branch4.x+80;monkeyG2S.y = branch4.y-430;
monkeyG2S.y = monkeyG2S.y+400;
monkeyG2S:play({startFrame = 1,endFrame = 1,loop = 1})
monkeysmove4S();
end

if count == 40 then

monkeysCount = monkeysCount + 4;
numberofMonkeys = 4;

timer.performWithDelay(1000,monkeyFirst);
timer.performWithDelay(100,monkeyThird);
timer.performWithDelay(3000,monkeyFourth);
timer.performWithDelay(800,monkeySecond);

--timer.performWithDelay(2000,callfunc1);
end

local function callfunc2()
monkeyG1S.alpha = 1;
monkeyG1S.x = branch3.x-20;monkeyG1S.y = branch3.y-430;
monkeyG1S.y = monkeyG1S.y+370;
monkeyG1S:play({startFrame = 1,endFrame = 1,loop = 1})
monkeysmove3S();

monkeyG2S.alpha = 1;
monkeyG2S.x = branch4.x+80;monkeyG2S.y = branch4.y-430;
monkeyG2S.y = monkeyG2S.y+400;
monkeyG2S:play({startFrame = 1,endFrame = 1,loop = 1})
monkeysmove4S();

monkeyG3S.alpha = 1;
monkeyG3S.x = branch7.x;monkeyG3S.y = branch7.y-430;
monkeyG3S.y = monkeyG3S.y+370;
monkeyG3S:play({startFrame = 1,endFrame = 1,loop = 1})

monkeysmoveG3S();

monkeyG4S.alpha = 1;
monkeyG4S.x = branch8.x+65;monkeyG4S.y = branch8.y-430;
monkeyG4S.y = monkeyG4S.y+400;
monkeyG4S:play({startFrame = 1,endFrame = 1,loop = 1})
monkeysmoveG4S();
end

if count == 42 then
monkeysCount = monkeysCount + 3;
numberofMonkeys = 3;


monkeyFirst();
monkeyFourth();
monkeySecond();

--timer.performWithDelay(2000,callfunc2);
end

if count == 43 or count == 45 or count == 47 then
numberofMonkeys = 4;
monkeysCount = monkeysCount + 4;

monkeyFirst();
timer.performWithDelay(200,monkeyThird);
timer.performWithDelay(500,monkeyFourth);
timer.performWithDelay(800,monkeySecond);
--timer.performWithDelay(2000,monkeySecondS);

end

if count == 44 then
numberofMonkeys = 4;
monkeysCount = monkeysCount + 4;
print('44mc : ',monkeysCount);
--monkeyFirstS();
--100th
monkeyColorSecond();
monkeyThird();

timer.performWithDelay(1000,monkeyFourth);
timer.performWithDelay(2000,monkeyFirst);--103
end


if count == 46 or count == 48 then
numberofMonkeys = 4;
monkeysCount = monkeysCount + 4;
monkeyThird();
timer.performWithDelay(100,monkeyFourth);
timer.performWithDelay(1000,monkeySecond);
timer.performWithDelay(2000,monkeyFirst);
end

if count == 49 then
monkeysCount = monkeysCount + 4;
numberofMonkeys = 4;
score = score+1;
timer.performWithDelay(1600,monkeyFirst);
timer.performWithDelay(100,monkeyThird);
timer.performWithDelay(3100,monkeyFourth);
timer.performWithDelay(800,monkeySecond);

end

if count == 50 or count == 53 or count == 58 then
numberofMonkeys = 4;
monkeysCount = monkeysCount + 4;
score = score+1;
timer.performWithDelay(100,monkeyFirst);
timer.performWithDelay(100,monkeyThird);
timer.performWithDelay(300,monkeyFourth);
timer.performWithDelay(800,monkeySecond);
--timer.performWithDelay(200,monkeyFirstS);
end

if count == 51 or count == 56 or count == 55 then
numberofMonkeys = 4;
monkeysCount = monkeysCount + 4;
score = score+1;
--timer.performWithDelay(2000,monkeyFirstS);
timer.performWithDelay(100,monkeyThird);
timer.performWithDelay(300,monkeyFourth);
timer.performWithDelay(600,monkeySecond)
timer.performWithDelay(200,monkeyFirst);
end

if count == 52 or count == 57 or count == 54 then
numberofMonkeys = 4;
monkeysCount = monkeysCount + 4;
score = score+1;
timer.performWithDelay(1000,monkeyFirst);
timer.performWithDelay(100,monkeyThird);
timer.performWithDelay(500,monkeyFourth);
timer.performWithDelay(800,monkeySecond);
--timer.performWithDelay(200,monkeySecondS);
end

if count == 59 then
numberofMonkeys = 4;
monkeysCount = monkeysCount + 4;

print('59mc : ',monkeysCount);
monkeyFirst();
monkeyThird();
--150th --  
monkeyColorFourth();
monkeySecond();
--timer.performWithDelay(2000,monkeyFirstS);
end

if count == 60 or count == 62 or count == 64 or count == 66 then
monkeysCount = monkeysCount + 4;
numberofMonkeys = 4;
score = score+2;
timer.performWithDelay(900,monkeyFirst);
timer.performWithDelay(100,monkeyThird);
timer.performWithDelay(400,monkeyFourth);
timer.performWithDelay(800,monkeySecond);
end

if count == 61 or count == 63 or count == 65 then
monkeysCount = monkeysCount + 4;
numberofMonkeys = 4;
score = score+2;
timer.performWithDelay(500,monkeyFirst);
timer.performWithDelay(100,monkeyThird);
timer.performWithDelay(1000,monkeyFourth);
timer.performWithDelay(800,monkeySecond);
end


if count == 67 then
numberofMonkeys = 4;
monkeysCount = monkeysCount + 4;
score = score+1;

print('67mc : ',monkeysCount);
monkeyFirst();
monkeyThird();
--200TH--
monkeyColorSecond();
monkeyFourth();

end
--28

if count == 68 or count == 70 or count == 72 then
monkeysCount = monkeysCount + 4;
numberofMonkeys = 4;
score = score+2;
timer.performWithDelay(900,monkeyFirst);
timer.performWithDelay(100,monkeyThird);
timer.performWithDelay(200,monkeyFourth);
timer.performWithDelay(500,monkeySecond);
end

if count == 69 or count == 71 then
monkeysCount = monkeysCount + 4;
numberofMonkeys = 4;
score = score+2;
timer.performWithDelay(100,monkeyFirst);
timer.performWithDelay(1000,monkeyThird);
timer.performWithDelay(300,monkeyFourth);
timer.performWithDelay(800,monkeySecond);
end


if count == 73 then
monkeysCount = monkeysCount + 4;
numberofMonkeys = 4;
score = score+2;
timer.performWithDelay(1000,monkeyFirst);
timer.performWithDelay(100,monkeyThird);
timer.performWithDelay(3000,monkeyFourth);


if monkeysCount <= 250 then
monkeyColorThird();
elseif monkeysCount > 250 and monkeysCount <= 300 then
monkeyColorFifth();
elseif monkeysCount > 300 and monkeysCount <= 350 then
monkeyColorFirst();
elseif monkeysCount > 350 and monkeysCount <= 400 then
monkeyColorSecond();
elseif monkeysCount > 400 and monkeysCount <= 450 then
monkeyColorThird();
elseif monkeysCount > 450 and monkeysCount <= 500 then
monkeyColorFourth();
elseif monkeysCount > 500 and monkeysCount <= 550 then
monkeyColorFifth();
elseif monkeysCount > 550 and monkeysCount <= 600 then
monkeyColorThird();
elseif monkeysCount > 600 and monkeysCount <= 650 then
monkeyColorSecond();
elseif monkeysCount > 650 and monkeysCount <= 700 then
monkeyColorFirst();
elseif monkeysCount > 700 and monkeysCount <= 750 then
monkeyColorFourth();
elseif monkeysCount > 750 and monkeysCount <= 800 then
monkeyColorFifth();
elseif monkeysCount > 800 and monkeysCount <= 850 then
monkeyColorThird();
elseif monkeysCount > 850 and monkeysCount <= 900 then
monkeyColorFifth();
elseif monkeysCount > 900 and monkeysCount <= 950 then
monkeyColorFirst();
elseif monkeysCount > 950 and monkeysCount <= 1000 then
monkeyColorThird();
elseif monkeysCount > 1000 and monkeysCount <= 1050 then
monkeyColorFourth();
elseif monkeysCount > 1050 and monkeysCount <= 1100 then
monkeyColorSecond();
elseif monkeysCount > 1100 and monkeysCount <= 1150 then
monkeyColorFifth();
elseif monkeysCount > 1150 and monkeysCount <= 1200 then
monkeyColorFirst();
elseif monkeysCount > 1200 and monkeysCount <= 1250 then
monkeyColorThird();
elseif monkeysCount > 1250 and monkeysCount <= 1300 then
monkeyColorFifth();
elseif monkeysCount > 1300 and monkeysCount <= 1350 then
monkeyColorFirst();
elseif monkeysCount > 1350 and monkeysCount <= 1400 then
monkeyColorSecond();
elseif monkeysCount > 1400 and monkeysCount <= 1450 then
monkeyColorThird();
elseif monkeysCount > 1450 and monkeysCount <= 1500 then
monkeyColorFourth();
elseif monkeysCount > 1500 and monkeysCount <= 1550 then
monkeyColorFifth();
elseif monkeysCount > 1550 and monkeysCount <= 1600 then
monkeyColorThird();
elseif monkeysCount > 1600 and monkeysCount <= 1650 then
monkeyColorSecond();
elseif monkeysCount > 1650 and monkeysCount <= 1700 then
monkeyColorFirst();
elseif monkeysCount > 1700 and monkeysCount <= 1750 then
monkeyColorFourth();
elseif monkeysCount > 1750 and monkeysCount <= 1800 then
monkeyColorFifth();
elseif monkeysCount > 1800 and monkeysCount <= 1850 then
monkeyColorThird();
elseif monkeysCount > 1850 and monkeysCount <= 1900 then
monkeyColorFifth();
elseif monkeysCount > 1900 and monkeysCount <= 1950 then
monkeyColorFirst();
elseif monkeysCount > 1950 and monkeysCount <= 2000 then
monkeyColorThird();
elseif monkeysCount > 2000 and monkeysCount <= 2050 then
monkeyColorSecond();
elseif monkeysCount > 2050 and monkeysCount <= 2100 then
monkeyColorThird();
elseif monkeysCount > 2100 and monkeysCount <= 2150 then
monkeyColorFourth();
elseif monkeysCount > 2150 and monkeysCount <= 2200 then
monkeyColorFirst();
elseif monkeysCount > 2200 and monkeysCount <= 2250 then
monkeyColorThird();
elseif monkeysCount > 2250 and monkeysCount <= 2300 then
monkeyColorFifth();
elseif monkeysCount > 2300 and monkeysCount <= 2350 then
monkeyColorFirst();
elseif monkeysCount > 2350 and monkeysCount <= 2400 then
monkeyColorSecond();
elseif monkeysCount > 2400 and monkeysCount <= 2450 then
monkeyColorThird();
elseif monkeysCount > 2450 and monkeysCount <= 2500 then
monkeyColorFourth();
elseif monkeysCount > 2500 and monkeysCount <= 2550 then
monkeyColorFifth();
elseif monkeysCount > 2550 and monkeysCount <= 2600 then
monkeyColorThird();
elseif monkeysCount > 2600 and monkeysCount <= 2650 then
monkeyColorSecond();
elseif monkeysCount > 2650 and monkeysCount <= 2700 then
monkeyColorFirst();
elseif monkeysCount > 2700 and monkeysCount <= 2750 then
monkeyColorFourth();
elseif monkeysCount > 2750 and monkeysCount <= 2800 then
monkeyColorFifth();
elseif monkeysCount > 2800 and monkeysCount <= 2850 then
monkeyColorThird();
elseif monkeysCount > 2850 and monkeysCount <= 2900 then
monkeyColorFifth();
elseif monkeysCount > 2900 and monkeysCount <= 2950 then
monkeyColorFirst();
elseif monkeysCount > 2950 and monkeysCount <= 3000 then
monkeyColorThird();
elseif monkeysCount > 3000 and monkeysCount <= 3050 then
monkeyColorFourth();
elseif monkeysCount > 3050 and monkeysCount <= 3100 then
monkeyColorSecond();
elseif monkeysCount > 3100 and monkeysCount <= 3150 then
monkeyColorFifth();
elseif monkeysCount > 3150 and monkeysCount <= 3200 then
monkeyColorFirst();
elseif monkeysCount > 3200 and monkeysCount <= 3250 then
monkeyColorThird();
elseif monkeysCount > 3250 and monkeysCount <= 3300 then
monkeyColorFifth();
elseif monkeysCount > 3300 and monkeysCount <= 3350 then
monkeyColorFirst();
elseif monkeysCount > 3350 and monkeysCount <= 3400 then
monkeyColorSecond();
elseif monkeysCount > 3400 and monkeysCount <= 3450 then
monkeyColorThird();
elseif monkeysCount > 3450 and monkeysCount <= 3500 then
monkeyColorFourth();
elseif monkeysCount > 3500 and monkeysCount <= 3550 then
monkeyColorFifth();
elseif monkeysCount > 3550 and monkeysCount <= 3600 then
monkeyColorThird();
elseif monkeysCount > 3600 and monkeysCount <= 3650 then
monkeyColorSecond();
elseif monkeysCount > 3650 and monkeysCount <= 3700 then
monkeyColorFirst();
elseif monkeysCount > 1700 and monkeysCount <= 3750 then
monkeyColorFourth();
elseif monkeysCount > 1750 and monkeysCount <= 3800 then
monkeyColorFifth();
elseif monkeysCount > 3800 and monkeysCount <= 3850 then
monkeyColorThird();
elseif monkeysCount > 3850 and monkeysCount <= 3900 then
monkeyColorFifth();
elseif monkeysCount > 3900 and monkeysCount <= 3950 then
monkeyColorFirst();
elseif monkeysCount > 3950 and monkeysCount <= 4000 then
monkeyColorThird();
elseif monkeysCount > 4000 and monkeysCount <= 4050 then
monkeyColorFirst();
elseif monkeysCount > 4050 and monkeysCount <= 4100 then
monkeyColorThird();
elseif monkeysCount > 4100 and monkeysCount <= 4150 then
monkeyColorFifth();
elseif monkeysCount > 4150 and monkeysCount <= 4200 then
monkeyColorFirst();
elseif monkeysCount > 4200 and monkeysCount <= 4250 then
monkeyColorThird();
elseif monkeysCount > 4250 and monkeysCount <= 4300 then
monkeyColorFifth();
elseif monkeysCount > 4300 and monkeysCount <= 4350 then
monkeyColorFirst();
elseif monkeysCount > 4350 and monkeysCount <= 4400 then
monkeyColorSecond();
elseif monkeysCount > 4400 and monkeysCount <= 4450 then
monkeyColorThird();
elseif monkeysCount > 4450 and monkeysCount <= 4500 then
monkeyColorFourth();
elseif monkeysCount > 4500 and monkeysCount <= 4550 then
monkeyColorFifth();
elseif monkeysCount > 4550 and monkeysCount <= 4600 then
monkeyColorThird();
elseif monkeysCount > 4600 and monkeysCount <= 4650 then
monkeyColorSecond();
elseif monkeysCount > 4650 and monkeysCount <= 4700 then
monkeyColorFirst();
elseif monkeysCount > 4700 and monkeysCount <= 4750 then
monkeyColorFourth();
elseif monkeysCount > 4750 and monkeysCount <= 4800 then
monkeyColorFifth();
elseif monkeysCount > 4800 and monkeysCount <= 4850 then
monkeyColorThird();
elseif monkeysCount > 4850 and monkeysCount <= 4900 then
monkeyColorFifth();
elseif monkeysCount > 4900 and monkeysCount <= 4950 then
monkeyColorFirst();
elseif monkeysCount > 4950 and monkeysCount <= 5000 then
monkeyColorThird();
elseif monkeysCount > 5000 and monkeysCount <= 5050 then
monkeyColorFourth();
elseif monkeysCount > 5050 and monkeysCount <= 5100 then
monkeyColorSecond();
elseif monkeysCount > 5100 and monkeysCount <= 5150 then
monkeyColorFifth();
elseif monkeysCount > 5150 and monkeysCount <= 1200 then
monkeyColorFirst();
elseif monkeysCount > 5200 and monkeysCount <= 5250 then
monkeyColorThird();
elseif monkeysCount > 5250 and monkeysCount <= 5300 then
monkeyColorFifth();
elseif monkeysCount > 5300 and monkeysCount <= 5350 then
monkeyColorFirst();
elseif monkeysCount > 5350 and monkeysCount <= 5400 then
monkeyColorSecond();
elseif monkeysCount > 5400 and monkeysCount <= 5450 then
monkeyColorThird();
elseif monkeysCount > 5450 and monkeysCount <= 5500 then
monkeyColorFourth();
elseif monkeysCount > 5500 and monkeysCount <= 5550 then
monkeyColorFifth();
elseif monkeysCount > 5550 and monkeysCount <= 5600 then
monkeyColorThird();
elseif monkeysCount > 5600 and monkeysCount <= 5650 then
monkeyColorSecond();
elseif monkeysCount > 5650 and monkeysCount <= 5700 then
monkeyColorFirst();
elseif monkeysCount > 5700 and monkeysCount <= 5750 then
monkeyColorFourth();
elseif monkeysCount > 5750 and monkeysCount <= 5800 then
monkeyColorFifth();
elseif monkeysCount > 5800 and monkeysCount <= 5850 then
monkeyColorThird();
elseif monkeysCount > 5850 and monkeysCount <= 5900 then
monkeyColorFifth();
elseif monkeysCount > 5900 and monkeysCount <= 5950 then
monkeyColorFirst();
elseif monkeysCount > 5950 and monkeysCount <= 6000 then
monkeyColorThird();
elseif monkeysCount > 6000 and monkeysCount <= 6050 then
monkeyColorFirst();
elseif monkeysCount > 6050 and monkeysCount <= 6100 then
monkeyColorThird();
elseif monkeysCount > 6100 and monkeysCount <= 6150 then
monkeyColorFifth();
elseif monkeysCount > 6150 and monkeysCount <= 6200 then
monkeyColorFirst();
elseif monkeysCount > 6200 and monkeysCount <= 6250 then
monkeyColorThird();
elseif monkeysCount > 6250 and monkeysCount <= 6300 then
monkeyColorFifth();
elseif monkeysCount > 6300 and monkeysCount <= 6350 then
monkeyColorFirst();
elseif monkeysCount > 6350 and monkeysCount <= 6400 then
monkeyColorSecond();
elseif monkeysCount > 6400 and monkeysCount <= 6450 then
monkeyColorThird();
elseif monkeysCount > 6450 and monkeysCount <= 6500 then
monkeyColorFourth();
elseif monkeysCount > 6500 and monkeysCount <= 6550 then
monkeyColorFifth();
elseif monkeysCount > 6550 and monkeysCount <= 6600 then
monkeyColorThird();
elseif monkeysCount > 6600 and monkeysCount <= 6650 then
monkeyColorSecond();
elseif monkeysCount > 6650 and monkeysCount <= 6700 then
monkeyColorFirst();
elseif monkeysCount > 6700 and monkeysCount <= 6750 then
monkeyColorFourth();
elseif monkeysCount > 6750 and monkeysCount <= 6800 then
monkeyColorFifth();
elseif monkeysCount > 6800 and monkeysCount <= 6850 then
monkeyColorThird();
elseif monkeysCount > 6850 and monkeysCount <= 6900 then
monkeyColorFifth();
elseif monkeysCount > 6900 and monkeysCount <= 6950 then
monkeyColorFirst();
elseif monkeysCount > 6950 and monkeysCount <= 7000 then
monkeyColorThird();
elseif monkeysCount > 7000 and monkeysCount <= 7050 then
monkeyColorFourth();
elseif monkeysCount > 7050 and monkeysCount <= 7100 then
monkeyColorSecond();
elseif monkeysCount > 7100 and monkeysCount <= 7150 then
monkeyColorFifth();
elseif monkeysCount > 7150 and monkeysCount <= 7200 then
monkeyColorFirst();
elseif monkeysCount > 7200 and monkeysCount <= 7250 then
monkeyColorThird();
elseif monkeysCount > 7250 and monkeysCount <= 7300 then
monkeyColorFifth();
elseif monkeysCount > 7300 and monkeysCount <= 7350 then
monkeyColorFirst();
elseif monkeysCount > 7350 and monkeysCount <= 7400 then
monkeyColorSecond();
elseif monkeysCount > 7400 and monkeysCount <= 7450 then
monkeyColorThird();
elseif monkeysCount > 7450 and monkeysCount <= 7500 then
monkeyColorFourth();
elseif monkeysCount > 7500 and monkeysCount <= 7550 then
monkeyColorFifth();
elseif monkeysCount > 7550 and monkeysCount <= 7600 then
monkeyColorThird();
elseif monkeysCount > 7600 and monkeysCount <= 7650 then
monkeyColorSecond();
elseif monkeysCount > 7650 and monkeysCount <= 7700 then
monkeyColorFirst();
elseif monkeysCount > 7700 and monkeysCount <= 7750 then
monkeyColorFourth();
elseif monkeysCount > 7750 and monkeysCount <= 7800 then
monkeyColorFifth();
elseif monkeysCount > 7800 and monkeysCount <= 7850 then
monkeyColorThird();
elseif monkeysCount > 7850 and monkeysCount <= 7900 then
monkeyColorFifth();
elseif monkeysCount > 7900 and monkeysCount <= 7950 then
monkeyColorFirst();
elseif monkeysCount > 7950 and monkeysCount <= 8000 then
monkeyColorThird();
elseif monkeysCount > 8000 and monkeysCount <= 8050 then
monkeyColorFourth();
elseif monkeysCount > 8050 and monkeysCount <= 8100 then
monkeyColorSecond();
elseif monkeysCount > 8100 and monkeysCount <= 8150 then
monkeyColorFifth();
elseif monkeysCount > 8150 and monkeysCount <= 8200 then
monkeyColorFirst();
elseif monkeysCount > 8200 and monkeysCount <= 8250 then
monkeyColorThird();
elseif monkeysCount > 8250 and monkeysCount <= 8300 then
monkeyColorFifth();
elseif monkeysCount > 8300 and monkeysCount <= 8350 then
monkeyColorFirst();
elseif monkeysCount > 8350 and monkeysCount <= 8400 then
monkeyColorSecond();
elseif monkeysCount > 8400 and monkeysCount <= 8450 then
monkeyColorThird();
elseif monkeysCount > 8450 and monkeysCount <= 8500 then
monkeyColorFourth();
elseif monkeysCount > 8500 and monkeysCount <= 8550 then
monkeyColorFifth();
elseif monkeysCount > 8550 and monkeysCount <= 8600 then
monkeyColorThird();
elseif monkeysCount > 8600 and monkeysCount <= 8650 then
monkeyColorSecond();
elseif monkeysCount > 8650 and monkeysCount <= 8700 then
monkeyColorFirst();
elseif monkeysCount > 8700 and monkeysCount <= 8750 then
monkeyColorFourth();
elseif monkeysCount > 8750 and monkeysCount <= 8800 then
monkeyColorFifth();
elseif monkeysCount > 8800 and monkeysCount <= 8850 then
monkeyColorThird();
elseif monkeysCount > 8850 and monkeysCount <= 8900 then
monkeyColorFifth();
elseif monkeysCount > 8900 and monkeysCount <= 8950 then
monkeyColorFirst();
elseif monkeysCount > 8950 and monkeysCount <= 9000 then
monkeyColorThird();
elseif monkeysCount > 9000 and monkeysCount <= 9050 then
monkeyColorFourth();
elseif monkeysCount > 9050 and monkeysCount <= 9100 then
monkeyColorSecond();
elseif monkeysCount > 9100 and monkeysCount <= 9150 then
monkeyColorFifth();
elseif monkeysCount > 9150 and monkeysCount <= 9200 then
monkeyColorFirst();
elseif monkeysCount <= 9200 and monkeysCount <= 9250 then
monkeyColorThird();
elseif monkeysCount > 9250 and monkeysCount <= 9300 then
monkeyColorFifth();
elseif monkeysCount > 9300 and monkeysCount <= 9350 then
monkeyColorFirst();
elseif monkeysCount > 9350 and monkeysCount <= 9400 then
monkeyColorSecond();
elseif monkeysCount > 9400 and monkeysCount <= 9450 then
monkeyColorThird();
elseif monkeysCount > 9450 and monkeysCount <= 9500 then
monkeyColorFourth();
elseif monkeysCount > 9500 and monkeysCount <= 9550 then
monkeyColorFifth();
elseif monkeysCount > 9550 and monkeysCount <= 9600 then
monkeyColorThird();
elseif monkeysCount > 9600 and monkeysCount <= 9650 then
monkeyColorSecond();
elseif monkeysCount > 9650 and monkeysCount <= 9700 then
monkeyColorFirst();
elseif monkeysCount > 9700 and monkeysCount <= 9750 then
monkeyColorFourth();
elseif monkeysCount > 9750 and monkeysCount <= 9800 then
monkeyColorFifth();
elseif monkeysCount > 9800 and monkeysCount <= 9850 then
monkeyColorThird();
elseif monkeysCount > 9850 and monkeysCount <= 9900 then
monkeyColorFifth();
elseif monkeysCount > 9900 and monkeysCount <= 9950 then
monkeyColorFirst();
end

end


if count == 74 then
if monkeysCount > 9900 and monkeysCount <= 9950 then
monkeysCount = 9950;
count = 75;
else
count = 68;
monkeysAppear();
end
end

if count == 75 or count == 77 or count == 79 then
monkeysCount = monkeysCount + 4;
numberofMonkeys = 4;
score = score+2;
timer.performWithDelay(100,monkeyFirst);
timer.performWithDelay(100,monkeyThird);
timer.performWithDelay(1000,monkeyFourth);
timer.performWithDelay(100,monkeySecond);
end

if count == 76 or count == 78 or count == 80 then
monkeysCount = monkeysCount + 4;
numberofMonkeys = 4;
score = score+2;
timer.performWithDelay(100,monkeyFirst);
timer.performWithDelay(100,monkeyThird);
timer.performWithDelay(300,monkeyFourth);
timer.performWithDelay(80,monkeySecond);
end

if count == 81 then
numberofMonkeys = 4;
monkeysCount = monkeysCount + 4;
monkeyFirst();
monkeyThird();
monkeyFourth();
monkeysCount = 9999;
monkeyColorGold();
end

print('count',count);
print('monkeysCount',monkeysCount);

leaves:toFront();
banana:toFront();
cross:toFront();
scoreTxt:toFront();
btnMusicOff:toFront(leaves);
btnMusicOn:toFront(leaves);
home:toFront(leaves);
slingShot:toFront(leaves);
background:addEventListener( "tap", stoneMove )
numberofMonkey = numberofMonkeys;

end

function startGame()

branch1.alpha = 1;branch2.alpha = 1;branch3.alpha = 1;branch4.alpha = 1;branch5.alpha = 1;branch6.alpha = 1;
branch7.alpha = 1;branch8.alpha = 1;

branche1.alpha = 1;branche2.alpha = 1;branche3.alpha = 1;

PlayBackgroundMusic();

timer.performWithDelay(1000,stoneAppear)

timer.performWithDelay(2000,monkeysAppear);
end

local function stopmonkey1Actions()
 transition.cancel(tr0);  transition.cancel(tr1);  transition.cancel(tr2);  transition.cancel(tr3);  transition.cancel(tr4);
   if t5 ~= nil then timer.cancel(t5); end
    if t6 ~= nil then timer.cancel(t6); end if t7 ~= nil then timer.cancel(t7);end
    if t8 ~= nil then timer.cancel(t8); end
    if t9 ~= nil then timer.cancel(t9);end
    
    if trans1 ~= nil then transition.cancel(trans1);end
     if trans2 ~= nil then transition.cancel(trans2);end
      if trans3 ~= nil then transition.cancel(trans3);end
       if trans4 ~= nil then transition.cancel(trans4);end
       
end
local function stopmonkey2Actions()
 transition.cancel(tr5);  transition.cancel(tr6);  transition.cancel(tr7);  transition.cancel(tr8); transition.cancel(tr9);
  if t0 ~= nil then timer.cancel(t0);end 
   if t1 ~= nil then timer.cancel(t1);end 
    if t2 ~= nil then timer.cancel(t2); end
    if t3 ~= nil then timer.cancel(t3); end
    if t4 ~= nil then  timer.cancel(t4);  end
    
    if trans5 ~= nil then transition.cancel(trans5);end
     if trans6 ~= nil then transition.cancel(trans6);end
      if trans7 ~= nil then transition.cancel(trans7);end
       if trans8 ~= nil then transition.cancel(trans8);end
       
end
local function stopmonkey3Actions()
 transition.cancel(tr10);  transition.cancel(tr11);  transition.cancel(tr12);  transition.cancel(tr13);  transition.cancel(tr14);  transition.cancel(tr15);
   if t10 ~= nil then timer.cancel(t10); end  if t11 ~= nil then timer.cancel(t11); end    if t12 ~= nil then timer.cancel(t12); end
    if t13 ~= nil then timer.cancel(t13); end    if t14 ~= nil then timer.cancel(t14); end    if t15 ~= nil then timer.cancel(t15); end
    if t16 ~= nil then timer.cancel(t16); end
    
    if trans9 ~= nil then transition.cancel(trans9);end
     if trans10 ~= nil then transition.cancel(trans10);end
      if trans11 ~= nil then transition.cancel(trans11);end
       if trans12 ~= nil then transition.cancel(trans12);end
       if trans13 ~= nil then transition.cancel(trans13);end
       
end

local function stopmonkey4Actions()
 transition.cancel(tr17);  transition.cancel(tr18);  transition.cancel(tr19);  transition.cancel(tr20);  transition.cancel(tr21);  transition.cancel(tr22);
   if t17 ~= nil then timer.cancel(t17); end    if t18 ~= nil then timer.cancel(t18); end
    if t19 ~= nil then timer.cancel(t19); end    if t20 ~= nil then timer.cancel(t20); end    if t21 ~= nil then timer.cancel(t21); end
    if t22 ~= nil then timer.cancel(t22); end
    
      if trans14 ~= nil then transition.cancel(trans14);end
     if trans15 ~= nil then transition.cancel(trans15);end
      if trans16 ~= nil then transition.cancel(trans16);end
       if trans17 ~= nil then transition.cancel(trans17);end
       if trans18 ~= nil then transition.cancel(trans18);end
       
    end
  local function stopmonkey1SActions()  
     transition.cancel(tr0S);  transition.cancel(tr1S);  transition.cancel(tr2S);  transition.cancel(tr3S);  transition.cancel(tr4S);
   if t5S ~= nil then timer.cancel(t5S); end
    if t6S ~= nil then timer.cancel(t6S); end if t7S ~= nil then timer.cancel(t7S);end
    if t8S ~= nil then timer.cancel(t8S); end
    if t9S ~= nil then timer.cancel(t9S);end
    
      if trans1S ~= nil then transition.cancel(trans1S);end
     if trans2S ~= nil then transition.cancel(trans2S);end
      if trans3S ~= nil then transition.cancel(trans3S);end
       if trans4S ~= nil then transition.cancel(trans4S);end
       
    end
     local function stopmonkey2SActions()  
     transition.cancel(tr5S);  transition.cancel(tr6S);  transition.cancel(tr7S);  transition.cancel(tr8S);
 transition.cancel(tr9S);
   if t1S ~= nil then timer.cancel(t1S);end 
    if t0S ~= nil then timer.cancel(t0S);end
    if t2S ~= nil then timer.cancel(t2S); end
    if t3S ~= nil then timer.cancel(t3S); end
    if t4S ~= nil then  timer.cancel(t4S);  end
    
     if trans5S ~= nil then transition.cancel(trans5S);end
     if trans6S ~= nil then transition.cancel(trans6S);end
      if trans7S ~= nil then transition.cancel(trans7S);end
       if trans8S ~= nil then transition.cancel(trans8S);end
       
       
    end
     local function stopmonkey3SActions()  
     transition.cancel(tr10S);  transition.cancel(tr11S);  transition.cancel(tr12S);  transition.cancel(tr13S);  transition.cancel(tr14S);  transition.cancel(tr15S);
   if t10S ~= nil then timer.cancel(t10S); end  if t11S ~= nil then timer.cancel(t11S); end    if t12S ~= nil then timer.cancel(t12S); end
    if t13S ~= nil then timer.cancel(t13S); end    if t14S ~= nil then timer.cancel(t14S); end    if t15S ~= nil then timer.cancel(t15S); end
    if t16S ~= nil then timer.cancel(t16S); end
    
    if trans9S ~= nil then transition.cancel(trans9S);end
     if trans10S ~= nil then transition.cancel(trans10S);end
      if trans11S ~= nil then transition.cancel(trans11S);end
       if trans12S ~= nil then transition.cancel(trans12S);end
       if trans13S ~= nil then transition.cancel(trans13S);end
       
    end
    local function stopmonkey4SActions()  
   transition.cancel(tr17S);  transition.cancel(tr18S);  transition.cancel(tr19S);  transition.cancel(tr20S);  transition.cancel(tr21S);  transition.cancel(tr22S);
   if t17S ~= nil then timer.cancel(t17S); end    if t18S ~= nil then timer.cancel(t18S); end
    if t19S ~= nil then timer.cancel(t19S); end    if t20S ~= nil then timer.cancel(t20S); end    if t21S ~= nil then timer.cancel(t21S); end
    if t22S ~= nil then timer.cancel(t22S); end
    
        if trans14S ~= nil then transition.cancel(trans14S);end
     if trans15S ~= nil then transition.cancel(trans15S);end
      if trans16S ~= nil then transition.cancel(trans16S);end
       if trans17S ~= nil then transition.cancel(trans17S);end
       if trans18S ~= nil then transition.cancel(trans18S);end
       
    end
    
    
local function tongueOutEnd()
monkeyMissing = 0; 
toungueOut.alpha = 0;
   
   disposeAnim();
   director:changeScene("gameOver")
  

--if numberofMonkeys == 0 then
-- count = count + 1;
-- timer.performWithDelay(500,monkeysAppear);
-- end
end

local function tongueOutAnim()
  stopmonkey1Actions(); stopmonkey2Actions(); stopmonkey3Actions(); stopmonkey4Actions();
    stopmonkey1SActions(); stopmonkey2SActions(); stopmonkey3SActions(); stopmonkey4SActions();
    if trf1 ~= nil then transition.cancel(trf1); end  if trf2 ~= nil then transition.cancel(trf2); end 
    if tm1 ~= nil then timer.cancel(tm1);end   if tm2 ~= nil then timer.cancel(tm2);end  if tm3 ~= nil then timer.cancel(tm3);end
    if tm4 ~= nil then timer.cancel(tm4);end  if tm5 ~= nil then timer.cancel(tm5);end  if tm6 ~= nil then timer.cancel(tm6);end
    if tm7 ~= nil then timer.cancel(tm7);end  if tm8 ~= nil then timer.cancel(tm8);end  if tm9 ~= nil then timer.cancel(tm9);end
    --if _G.musicOn == true then
local channeltongueOut=audio.play(audiotongue,{loops = 0});
--end
--toungueOut:play({startFrame = 2,endFrame = 2,loop = 1})
toungueOut:play();

timer.performWithDelay(2000,tongueOutEnd);
end


function secondRound()
monkeyMissing = monkeyMissing + 1;

print('numberofMonkeys',numberofMonkeys);
if numberofMonkeys == 1 then
if count <= 10 then 
numberofMonkeys = numberofMonkeys - 1;
 toungueOut.x = 400;
 toungueOut.y = 100;

toungueOut.alpha = 1;
toungueOut.y = toungueOut.y - 300;
transition.to(toungueOut,{time = 500,y = toungueOut.y + 390})

--toungueOut:play({startFrame = 1,endFrame = 1,loop = 1})

timer.performWithDelay(500,tongueOutAnim);
else
if monkeyMissing >= 1 then
 numberofMonkeys = numberofMonkeys - 1;
 toungueOut.x = 400;
 toungueOut.y = 100;

toungueOut.alpha = 1;
toungueOut.y = toungueOut.y - 300;
transition.to(toungueOut,{time = 500,y = toungueOut.y + 390})

--toungueOut:play({startFrame = 1,endFrame = 1,loop = 1})

timer.performWithDelay(500,tongueOutAnim);
end
end
end
if numberofMonkeys > 1 then
    numberofMonkeys = numberofMonkeys - 1;
end


--monkeyG1:removeEventListener("tap",shoot);
--monkeyG2:removeEventListener("tap",shoot);
--monkeyG3:removeEventListener("tap",shoot);
--monkeyG4:removeEventListener("tap",shoot);
--monkeyG1S:removeEventListener("tap",shoot);
--monkeyG2S:removeEventListener("tap",shoot);
--monkeyG3S:removeEventListener("tap",shoot);
--monkeyG4S:removeEventListener("tap",shoot);
--print('no',numberofMonkeys);

--[[if numberofMonkey == 1 then--]]
--[[if numberofMonkeys == 1 then
 numberofMonkeys = numberofMonkeys - 1;
 toungueOut.x = 400;
 toungueOut.y = 100;

toungueOut.alpha = 1;
toungueOut.y = toungueOut.y - 300;
transition.to(toungueOut,{time = 500,y = toungueOut.y + 390})

--toungueOut:play({startFrame = 1,endFrame = 1,loop = 1})

timer.performWithDelay(500,tongueOutAnim);
elseif  numberofMonkey > 1 and numberofMonkey <= 4 then
    numberofMonkeys = numberofMonkeys - 1;
    
    if numberofMonkeys == 1 then
     toungueOut.x = 400;
 toungueOut.y = 100;

toungueOut.alpha = 1;
toungueOut.y = toungueOut.y - 300;
transition.to(toungueOut,{time = 500,y = toungueOut.y + 390})

--toungueOut:play({startFrame = 1,endFrame = 1,loop = 1})

timer.performWithDelay(500,tongueOutAnim);
else
 count = count + 1;
 timer.performWithDelay(500,monkeysAppear);
end
elseif numberofMonkey > 4 and numberofMonkey <= 10 then
 numberofMonkeys = numberofMonkeys - 1;
    
    if numberofMonkeys == 3 then
     toungueOut.x = 400;
 toungueOut.y = 100;

toungueOut.alpha = 1;
toungueOut.y = toungueOut.y - 300;
transition.to(toungueOut,{time = 500,y = toungueOut.y + 390})

--toungueOut:play({startFrame = 1,endFrame = 1,loop = 1})

timer.performWithDelay(500,tongueOutAnim);
else
 count = count + 1;
 timer.performWithDelay(500,monkeysAppear);
end
    
end--]]
end

numberOfClicks = 0; 

local function initialPos()
stone.alpha = 0;
target.alpha = 0;
--transition.to(stone,{time = 100,delay = 0,x = 522.5,y =  alpha = 0})
stone.x = 522.5;
stone.y = 665;
end

 
 
local function stoneAppear()
stone.alpha = 1;
random = math.random(8)
end


local posSp;

function shoot(event)

random1 = random;
  --event.target:removeEventListener("tap",shoot);
 -- numberOfClicks = numberOfClicks+1;
  
  print('numberOfClicks',event.target.tag);
--  if _G.musicOn == true then
local channeltongueOut=audio.play(audioSlingShot,{loops = 0});
--end


 --[[ local function addEvnt()
  if event.target ~= nil then
    event.target:addEventListener("tap",shoot);
    end
  end
  
  timer.performWithDelay(1000,addEvnt);--]]
  
if event.target.alpha == 0.99 or event.target.tag == 100 then
--if event.target.alpha == 0.99 or event.target.alpha == 0.999 then
print('0numberOfClicks',numberOfClicks);
print('no a',numberOfClicks)
numberOfClicks = numberOfClicks + 1;
if numberOfClicks == 4 then
 numberOfClicks = 0;
 event.target.alpha = 1;
 event.target.tag = 1;
end
elseif event.target.alpha == 0.999 or event.target.tag == 101 then
numberOfClicks = numberOfClicks + 1;
if numberOfClicks == 9 then
 numberOfClicks = 0;
 event.target.alpha = 1;
  event.target.tag = 1;
end
elseif event.target.alpha == 1 or event.target.tag == 1 then
stone.alpha = 1;
local phase=event.phase
   -- if "began"==phase then
	xPos=event.x; yPos=event.y;
	target.alpha = 0;
	
	local pos = yPos+250;
	target.x = event.x;
    target.y = event.y;

local function cancelActions()
  if event.target == monkeyG1 then
 stopmonkey1Actions();
  elseif event.target == monkeyG2 then
 stopmonkey2Actions();
  elseif event.target == monkeyG3 then
 stopmonkey3Actions();
  elseif event.target == monkeyG4 then
 stopmonkey4Actions();
 elseif event.target == monkeyG1S then
 stopmonkey1SActions();
  elseif event.target == monkeyG2S then
 stopmonkey2SActions();
  elseif event.target == monkeyG3S then
 stopmonkey3SActions();
  elseif event.target == monkeyG4S then
 stopmonkey4SActions();
  end
  
  transition.cancel(trans);
end
   
    local function disappearM()
    numberOfClicks = 0;
     
     if event.target.alpha == 0.99 then
     score = score + 5;
     scoreTxt.text = score;
     elseif event.target.alpha == 0.999 then
     score = score + 10;
     scoreTxt.text = score;
     else
     score = score + 1;
     scoreTxt.text = score;
     end
     
     _G.score = score;
     
     if animSpeed >= 50 then
     animSpeed = animSpeed - 10;
     end
    
    if monkeyMissing > 2 then
    toungueOut.x = 400;
 toungueOut.y = 100;

toungueOut.alpha = 1;
toungueOut.y = toungueOut.y - 300;
transition.to(toungueOut,{time = 500,y = toungueOut.y + 390})
    else
    if numberofMonkeys > 0 then
    numberofMonkeys = numberofMonkeys - 1;
    end
    if numberofMonkeys == 0 then
     count = count + 1;
     monkeyMissing = 0;
    tm1 = timer.performWithDelay(0,monkeysAppear);
    end
    end
    end
    
    local function falldownAudio()
   -- if _G.musicOn == true then
    local channelaudioFallDown=audio.play(audioFallDown,{loops = 0});
   -- end
     end
     
     local function hide()
     
     transition.to( event.target,{time = 500,alpha = 0});
       transition.to(sparrow,{time = 500,alpha = 0});
     end
     
    local function sparrowPos()
         sparrow.y = event.target.y- sparrowOffset;
         sparrow.alpha = 1;
        sparrow:play();
        
        
    end
    
    local function disappear1()

    
     --local channelaudioFallDown=audio.play(audioSparrowChirping,{loops = 0});
     
     sparrow.x = event.target.x;
--    -- sparrow:scale(0.8,0.8);
--    if event.target ~= nil then
--     if event.target.y < 500 then
--     sparrow.y = event.target.y-40;
--     else
--     sparrow.y = event.target.y-60;
--     end
--     end
     
   
    --stone.alpha = 0;
    --print('y',event.target.y)
   if event.target.y < 345 and event.target.y > 100 then
    event.target.y = 500;
    
    --print('ay',event.target.y)
    end
    falldownAudio();
    timer.performWithDelay(0,hide)
     tm10 = timer.performWithDelay(0,sparrowPos);
     tm2 = timer.performWithDelay(1500,disappearM);
   
    end
    
    local function fall()
    event.target.alpha = 0.8;
    if random1 == 0 then
  --  event.target:play({startFrame = 5,endFrame = 5,loop = 1})
    event.target:play({startFrame = 8,endFrame = 8,loop = 1})
    elseif random1 == 5 then
    event.target:play({startFrame = 6,endFrame = 6,loop = 1})
    elseif random1 == 2 then
     event.target:play({startFrame = 8,endFrame = 8,loop = 1})
      elseif random1 == 3 then
     event.target:play({startFrame = 11,endFrame = 11,loop = 1})
      elseif random1 == 4 then
     event.target:play({startFrame = 12,endFrame = 12,loop = 1})
     elseif random1 == 1 then
     event.target:play({startFrame = 13,endFrame = 13,loop = 1})
     elseif random1 == 6 then
     event.target:play({startFrame = 14,endFrame = 14,loop = 1})
    else
     event.target:play({startFrame = 10,endFrame = 10,loop = 1})
    end
    
      transition.to(event.target,{time= 100,alpha = 1})
      
    end
    
    local function disappear2()
    
 
    sparrow.x = event.target.x;
    
   --  local channelaudioFallDown=audio.play(audioFallDown,{loops = 0});
       --local channelaudioFallDown=audio.play(audioSparrowChirping,{loops = 0});
       
   --  if event.target.y ~= nil then
--     if event.target.y < 500 then
--     sparrow.y = event.target.y-40;
--     else
--     sparrow.y = event.target.y-60;
--     end
--     end
     -- sparrow:scale(0.8,0.8);
     


 if event.target.y < 345 and event.target.y > 100 then
    event.target.y = 500;
    
    --print('ay',event.target.y)
    end
    
     falldownAudio();
      timer.performWithDelay(0,hide)
    tm10 = timer.performWithDelay(0,sparrowPos);
    tm3 = timer.performWithDelay(1500,disappearM);
    end
    if event.target.currentFrame() == 1 then
    
   if random1 == 0 or random == 2 then
   event.target:play({startFrame = 7,endFrame = 7,loop = 1})
   elseif random1 == 1 then
   event.target:play({startFrame = 13,endFrame = 13,loop = 1})
   elseif random1 == 6 then
   event.target:play({startFrame = 14,endFrame = 14,loop = 1})
    elseif random1 == 4 then
     event.target:play({startFrame = 12,endFrame = 12,loop = 1})
   else
    event.target:play({startFrame = 9,endFrame = 9,loop = 1})
    end
    --print'hit'
   
    local function fallDown1() 
    cancelActions();
    -- local channelaudioShoutin=audio.play(audioShoutin,{loops = 0});
    trstone = transition.to(stone,{time = 50,delay = 0,x = target.x,y = target.y})
    tm4 = timer.performWithDelay(100,initialPos);
     timer.performWithDelay(200,stoneAppear);
     --event.target:play({startFrame = 5,endFrame = 5,loop = 1})
    tm5 = timer.performWithDelay(1050,disappear1);
    
   
      
    timer.performWithDelay(800,fall);
    end
    
    trf1 = transition.to(event.target,{time = 500,delay = 200,y = pos,alpha = 0.8,onComplete = fallDown1()});
   
   -- transition.to(stone,{time = 400,delay = 700,y = target.y+200});
    -- transition.to(event.target,{time = 10,delay = 200,x = 522.5,y = event.target.y+100});
    --event.target:removeEventListener("tap",shoot);
    background:removeEventListener("tap",stoneMove);
    
    end
    if event.target.currentFrame() == 2 then
    
    if random1 == 0 or random1 == 2 then
   event.target:play({startFrame = 7,endFrame = 7,loop = 1})
 elseif random1 == 1 then
   event.target:play({startFrame = 13,endFrame = 13,loop = 1})
   elseif random1 == 6 then
   event.target:play({startFrame = 14,endFrame = 14,loop = 1})
    elseif random1 == 4 then
     event.target:play({startFrame = 12,endFrame = 12,loop = 1})
   else
    event.target:play({startFrame = 9,endFrame = 9,loop = 1})
    end
     --event.target:play({startFrame = 2,endFrame = 3,loop = 1})

     local function fallDown2()
    cancelActions();
    --local channelaudioFallDown=audio.play(audioFallDown,{loops = 0});
   -- local channelaudioShoutin=audio.play(audioShoutin,{loops = 0});
    
    trstone = transition.to(stone,{time = 50,delay = 0,x = target.x,y = target.y})
    tm7 = timer.performWithDelay(100,initialPos);
     timer.performWithDelay(300,stoneAppear);
     --event.target:play({startFrame = 3,endFrame = 3,loop = 1})
     tm8 = timer.performWithDelay(1050,disappear2);
      timer.performWithDelay(800,fall);
    
      
     end
    
     trf2 = transition.to(event.target,{time = 500,delay = 200,y = pos,alpha = 0.8,onComplete = fallDown2()});
    
      background:removeEventListener("tap",stoneMove);
      
       
    end

end
end

function stoneMove(event)
local phase=event.phase
--print'hhh'
--print('pos',event.y)
target.alpha = 0;
	target.x = event.x;
    target.y = event.y;
    
     transition.to(stone,{time = 150,delay = 0,x = target.x,y = target.y,onComplete})
     tini1 = timer.performWithDelay(200,initialPos);
     tini2 = timer.performWithDelay(400,stoneAppear);
    
end

function disposeAnim()
if monkeyG1 ~= nil then monkeyG1:removeSelf();monkeyG1 = nil;end
if monkeyG2 ~= nil then monkeyG2:removeSelf();monkeyG2 = nil;end
if monkeyG3 ~= nil then monkeyG3:removeSelf();monkeyG3 = nil;end
if monkeyG4 ~= nil then monkeyG4:removeSelf();monkeyG4 = nil;end
if monkeyG1S ~= nil then monkeyG1S:removeSelf();monkeyG1S = nil;end
if monkeyG2S ~= nil then monkeyG2S:removeSelf();monkeyG2S = nil;end
if monkeyG3S ~= nil then monkeyG3S:removeSelf();monkeyG3S = nil;end
if monkeyG4S ~= nil then monkeyG4S:removeSelf();monkeyG4S = nil;end
--if stone ~= nil then stone:removeSelf();stone = nil;end

audio.dispose(audioStartingMonkey)
audioStartingMonkey=nil;
end

local function homefUNC()
_G.fromGO = true;
_G.start = false;
stopmonkey1Actions()
stopmonkey2Actions()
stopmonkey3Actions()
stopmonkey4Actions()
stopmonkey1SActions()
stopmonkey2SActions()
stopmonkey3SActions()
stopmonkey4SActions()
audio.stop();
disposeAnim();
transition.cancel();
timer.cancel(tini1);
timer.cancel(tini2);

gameGroup:removeSelf();

end

home:addEventListener("tap",homefUNC);


return gameGroup

end