module(..., package.seeall)

--====================================================================--
-- SCENE: game
--====================================================================--

new = function ( params )
movieclip = require("movieclip")
require("mcx")
local widget = require("widget")

local gameOverGroup = display.newGroup();
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local deviceWidth = display.contentWidth
local deviceHeight = display.contentHeight

local audioGameOver = audio.loadSound("music/game over.mp3");
local btnMusicOff
local btnMusicOn
local score = 0;

print ('_G.musicOn',_G.musicOn);

print ('m',_G.score)

-- background Image 
local background = display.newImageRect( "images/game/GAME OVER SLICING/gameOverBg.jpg", 1024, 768 )
background.x = deviceWidth/2
background.y = deviceHeight/2
gameOverGroup:insert(background);

local background2 = display.newImage( "images/game/GAME OVER SLICING/BG2.png")
background2.x = deviceWidth/2
background2.y = deviceHeight/2+100
gameOverGroup:insert(background2);


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
  	defaultFile = "images/game/GAME OVER SLICING/SOUND ICON.png",
  	x = 40,
  	y = 30,
}
gameOverGroup:insert(btnMusicOff);
btnMusicOff:addEventListener("tap", musicToggle)
btnMusicOff.isVisible = false

-------------------------------- Music On Button
btnMusicOn = widget.newButton
{
	width = 50,
  	height = 50,
  	defaultFile = "images/game/GAME OVER SLICING/muteicon.png",
  	x = 40,
  	y = 30,
}
gameOverGroup:insert(btnMusicOn);
btnMusicOn:addEventListener("tap", musicToggle)
btnMusicOn.isVisible = false;

if _G.musicOn == true then
btnMusicOff.isVisible = true;
else
btnMusicOn.isVisible = true;
end

if _G.musicOn == true then
local channelaudioGameOver=audio.play(audioGameOver,{loops = 0});
end

local monkey = display.newImage( "images/game/GAME OVER SLICING/monkey weeping.png")
monkey.x = deviceWidth/2
monkey.y = deviceHeight/2-275
gameOverGroup:insert(monkey);

local gameOverTxt = display.newImage( "images/game/GAME OVER SLICING/GAME OVER.png")
gameOverTxt.x = deviceWidth/2
gameOverTxt.y = deviceHeight/2-165
gameOverGroup:insert(gameOverTxt);

local scoreTxt = display.newImage( "images/game/GAME OVER SLICING/SCORE.png")
scoreTxt.x = deviceWidth/2
scoreTxt.y = deviceHeight/2-55
gameOverGroup:insert(scoreTxt);

local rankTxt = display.newImage( "images/game/GAME OVER SLICING/rank.png")
rankTxt.x = deviceWidth/2
rankTxt.y = deviceHeight/2
gameOverGroup:insert(rankTxt);

local home = display.newImage( "images/game/GAME OVER SLICING/HOME ICON.png")
home.x = deviceWidth-50
home.y = 35
gameOverGroup:insert(home);

--local volume = display.newImage( "images/game/GAME OVER SLICING/HOME ICON.png")
--volume.x = deviceWidth-50
--volume.y = 50
--gameOverGroup:insert(volume);


local playBtn = display.newImage( "images/game/GAME OVER SLICING/play icon.png")
playBtn.x = deviceWidth/2
playBtn.y = deviceHeight/2+275;
gameOverGroup:insert(playBtn);

local box = display.newImage( "images/game/GAME OVER SLICING/box.png")
box.x = deviceWidth/2
box.y = deviceHeight/2+150;
gameOverGroup:insert(box);

local score_Txt = display.newText("0", deviceWidth/2+50 , deviceHeight/2+150, "Helvetica", 50 )
score_Txt:setTextColor(0.0,0.0,0.0,1.0)
gameOverGroup:insert(score_Txt);

local rank = display.newText("rank", deviceWidth/2+50 , deviceHeight/2+150, "Helvetica", 50 )
rank:setTextColor(0.0,0.0,0.0,1.0)
gameOverGroup:insert(rank);

if _G.score > score then
score = _G.score;
--_G.loginListener();
else
score = _G.score;
end


score_Txt.alpha = 0;
rank.alpha = 1;
rank.text = score;

local function bestScore()
score_Txt.alpha = 1;
rank.alpha = 0;
score_Txt.text = score;
end

scoreTxt:addEventListener("tap",bestScore)


local function bestRank()
score_Txt.alpha = 0;
rank.alpha = 1;
rank.text = score;
end

rankTxt:addEventListener("tap",bestRank)


local function back()
audio.stop();
director:changeScene("gamePlay")
end

playBtn:addEventListener("tap",back);

local function homefUNC()
_G.fromGO = true;
_G.start = false;
audio.stop();
gameOverGroup:removeSelf();

end

home:addEventListener("tap",homefUNC);

return gameOverGroup

end
