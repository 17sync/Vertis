local tweenService=game:GetService("TweenService")
local players=game:GetService("Players")

local menuController={}

local localPlayer=players.LocalPlayer

local playerGUI=nil
local mainMenu=nil

local background=nil
local logo=nil
local buttons=nil
local playButton=nil

local introSettings = {
    logoFade = 0.6,
    playFade = 0.4,
    logoDelay = 0.2
}

local outroSettings = {
    playFade = 0.25,
    logoFade = 0.5,
    backgroundFade = 0.8,
    backgroundDelay = 0.15
}

function menuController:init()

end

function menuController:getGUI()
    playerGUI=localPlayer:WaitForChild("PlayerGui")
    mainMenu=playerGUI:WaitForChild("mainmenu")
    background=mainMenu:WaitForChild("background")
    logo=mainMenu:WaitForChild("vertislogo")
    buttons=mainMenu:WaitForChild("buttons")
    playButton=buttons:WaitForChild("playbutton")
end

function menuController:fadeObject(object, transperancy, duration)
    
end

function menuController:playIntro()
    
end

function menuController:playOutro()

end

function menuController:destroy()

end

return menuController