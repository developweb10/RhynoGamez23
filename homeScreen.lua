module(..., package.seeall)

--====================================================================--
-- SCENE: homeScreen
--====================================================================--

new = function ( params )

local homeGroup = display.newGroup();
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local deviceWidth = display.contentWidth
local deviceHeight = display.contentHeight

-- background Image 
local background = display.newImageRect( "images/bg.jpg", 1024, 768 )
background.x = deviceWidth/2
background.y = deviceHeight/2
homeGroup:insert(background);

local startBtnImg = display.newImage("images/buttons/4.png");
startBtnImg.x = deviceWidth/2+20;
startBtnImg.y = deviceHeight-240;
startBtnImg.alpha = 1;
homeGroup:insert(startBtnImg);

local helpBtnImg = display.newImage("images/buttons/1.png");
helpBtnImg.x = deviceWidth/2+20;
helpBtnImg.y = deviceHeight-190;
helpBtnImg.alpha = 1;
homeGroup:insert(helpBtnImg);

local settingsBtnImg = display.newImage("images/buttons/2.png");
settingsBtnImg.x = deviceWidth/2+20;
settingsBtnImg.y = deviceHeight-140;
settingsBtnImg.alpha = 1;
homeGroup:insert(settingsBtnImg);

local storeBtnImg = display.newImage("images/buttons/3.png");
storeBtnImg.x = deviceWidth/2+20;
storeBtnImg.y = deviceHeight-90;
storeBtnImg.alpha = 1;
homeGroup:insert(storeBtnImg);


local start_btn; 

	--creation of  buttons
	local imageTable1 = {"images/buttons/start.png","images/buttons/starthover.png"}
	local imageTable2 = {"images/buttons/help.png","images/buttons/helphover.png"}
	local imageTable3 = {"images/buttons/settings.png","images/buttons/settingshover.png"}	
	local imageTable4 = {"images/buttons/store.png","images/buttons/storehover.png"}

		
	
	startBtn = movieclip.newAnim(imageTable1)
	startBtn.x = startBtnImg.x;
	startBtn.y = startBtnImg.y;
	startBtn.alpha = 1;	
	
	helpBtn = movieclip.newAnim(imageTable2)
	helpBtn.x = helpBtnImg.x;
	helpBtn.y = helpBtnImg.y;
	helpBtn.alpha = 1;	
	
	settingsBtn = movieclip.newAnim(imageTable3)
	settingsBtn.x = settingsBtnImg.x;
	settingsBtn.y = settingsBtnImg.y;
	settingsBtn.alpha = 1;	
	
	storeBtn = movieclip.newAnim(imageTable4)
	storeBtn.x = storeBtnImg.x;
	storeBtn.y = storeBtnImg.y;
	storeBtn.alpha = 1;	
	
local function startPlay()
startBtn:play{ startFrame=1, endFrame=2, loop=1 }
helpBtn:play{ startFrame=2, endFrame=1, loop=1 }
settingsBtn:play{ startFrame=2, endFrame=1, loop=1 }
storeBtn:play{ startFrame=2, endFrame=1, loop=1 }

director:changeScene("gamePlay")

return true
end

startBtn:addEventListener("tap",startPlay);

local function helpFunction()
helpBtn:play{ startFrame=1, endFrame=2, loop=1 }
startBtn:play{ startFrame=2, endFrame=1, loop=1 }
settingsBtn:play{ startFrame=2, endFrame=1, loop=1 }
storeBtn:play{ startFrame=2, endFrame=1, loop=1 }
end

helpBtn:addEventListener("tap",helpFunction);

local function settingsFun()
settingsBtn:play{ startFrame=1, endFrame=2, loop=1 }
startBtn:play{ startFrame=2, endFrame=1, loop=1 }
helpBtn:play{ startFrame=2, endFrame=1, loop=1 }
storeBtn:play{ startFrame=2, endFrame=1, loop=1 }
end

settingsBtn:addEventListener("tap",settingsFun);

local function storeFun()
storeBtn:play{ startFrame=1, endFrame=2, loop=1 }
startBtn:play{ startFrame=2, endFrame=1, loop=1 }
helpBtn:play{ startFrame=2, endFrame=1, loop=1 }
settingsBtn:play{ startFrame=2, endFrame=1, loop=1 }
end

storeBtn:addEventListener("tap",storeFun);


return homeGroup

 end