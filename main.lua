display.setStatusBar( display.HiddenStatusBar )

--====================================================================--
-- SCENE: main
--====================================================================--

main = function ( params )
local mainGroup = display.newGroup();
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local deviceWidth = display.contentWidth
local deviceHeight = display.contentHeight
director = require("director")
movieclip = require("movieclip")
local widget = require("widget")
--local gameNetwork = require "gameNetwork"
_G.musicOn = true;
_G.start = false;
_G.score = 0;
_G.fromGO = false;

-- Init game network to use Google Play game services
--[[gameNetwork.init("google")

local leaderboardId = "" -- Your leaderboard id here
local achievementId = "" -- Your achievement id here

-- Tries to automatically log in the user without displaying the login screen if the user doesn't want to login
gameNetwork.request("login",
{
	userInitiated = false
})

local left = display.screenOriginX
local top = display.screenOriginY
local width = display.viewableContentWidth - display.viewableContentWidth/100
local size = display.viewableContentHeight/15
local buttonTextSize = display.viewableContentWidth/20


-- Submits the score from the scoreTextField into the leaderboard
local function submitScoreListener(event)
	gameNetwork.request("setHighScore", 
		{
			localPlayerScore = 
			{
				category = leaderboardId, -- Id of the leaderboard to submit the score into
				value = _G.score -- The score to submit
			}
		})
end

local function unlockAchievementListener(event)
	gameNetwork.request("unlockAchievement",
		{
			achievement = 
			{
				identifier = achievementId -- The id of the achievement to unlock for the current user
			}
		})
end

local function showLeaderboardListener(event)
	gameNetwork.show("leaderboards") -- Shows all the leaderboards.
end

local function showAchievementsListener(event)
	gameNetwork.show("achievements") -- Shows the locked and unlocked achievements.
end

function _G.loginListener()
print'login'
gameNetwork.request("login",
			{
				--listener = _G.loginListener,
				userInitiated = true
			})
submitScoreListener();
end
--]]

-- background Image 
local background = display.newImageRect( "images/Loading/splash.jpg", 1024, 768 )
background.x = deviceWidth/2
background.y = deviceHeight/2
mainGroup:insert(background);


loadingSheet = graphics.newImageSheet("images/Loading/loading-3.png", { width= 536.976, height=25.992, numFrames=17 } )
-- play 15 frames every 500 ms
loading = display.newSprite( loadingSheet, { name="loading", start=1, count=17, time=1000 } )
loading.x = deviceWidth/2;
loading.y = deviceHeight/2+150;
loading.alpha = 0;
mainGroup:insert(loading)

local loading1 = display.newImageRect( "images/Rhyno.jpg", 1024, 768 )
loading1.x = deviceWidth/2
loading1.y = deviceHeight/2
mainGroup:insert(loading1);


local loadingText = display.newText("Loading...", loading.x , loading.y+40, "Chalkboard", 30 )
loadingText:setTextColor(1.0,1.0,1.0,1.0)
loadingText.alpha = 0;
mainGroup:insert(loadingText);


-- background Image 
local homebackground = display.newImageRect( "images/bg.jpg", 1024, 768 )
homebackground.x = deviceWidth/2
homebackground.y = deviceHeight/2
homebackground.alpha = 0;
mainGroup:insert(homebackground);

local startBtnImg = display.newImage("images/icons strt up/strt.png");
startBtnImg.x = deviceWidth/2+20;
startBtnImg.y = deviceHeight-190;
startBtnImg.alpha = 0;

local btnMusicOff
local btnMusicOn

print ('_G.musicOn',_G.musicOn);

--local musicOn = true
local function musicToggle( event )
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
       -- audio.play(_G.backgroundMusic);
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
  	y = 30,
}
mainGroup:insert(btnMusicOff);
btnMusicOff:addEventListener("tap", musicToggle)
btnMusicOff.isVisible = false

-------------------------------- Music On Button
btnMusicOn = widget.newButton
{
	width = 50,
  	height = 50,
  	defaultFile = "images/icons strt up/mute.png",
  	x = 40,
  	y = 30,
}
mainGroup:insert(btnMusicOn);
btnMusicOn:addEventListener("tap", musicToggle)
btnMusicOn.isVisible = false;

local start_btn; 

	--creation of  buttons
	local imageTable1 = {"images/icons strt up/green strt.png","images/icons strt up/start red.png"}	
	
	startBtn = movieclip.newAnim(imageTable1)
	startBtn.x = startBtnImg.x;
	startBtn.y = startBtnImg.y;
	startBtn.alpha = 0;	
	mainGroup:insert(startBtn);
	
	mainGroup:insert(startBtnImg);
	local function changeScreenStart()
	
	mainGroup:insert(director.directorView)
    director:changeScene("gamePlay")
   --director:changeScene("gameOver")
    _G.start = true;
    
	end
	
local function startPlay()
if _G.start == false then
startBtn:play{ startFrame=1, endFrame=2, loop=1 }

timer.performWithDelay(50,changeScreenStart)
end
return true
end

startBtn:addEventListener("tap",startPlay);

local function loadingEnd()
background.alpha = 0;
loading.alpha = 0;
loadingText.alpha = 0;
homebackground.alpha = 1;
startBtn.alpha = 1;--storeBtn.alpha = 1;settingsBtn.alpha = 1;helpBtn.alpha = 1;
startBtnImg.alpha = 1;--storeBtnImg.alpha = 1;settingsBtnImg.alpha = 1;helpBtnImg.alpha = 1;

if _G.musicOn == true then
btnMusicOff.isVisible = true;
else
btnMusicOn.isVisible = true;
end

end


local function animate()
loading.alpha = 1;
loading1.alpha = 0;
loadingText.alpha = 1;
loading:play({loops = 1});

timers=timer.performWithDelay(1000,loadingEnd,1)
end

if _G.fromGO == false then
timer.performWithDelay(2000,animate); --2000
--changeScreenStart();
else
loadingEnd();
btnMusicOff.isVisible = true;
end

end
main();