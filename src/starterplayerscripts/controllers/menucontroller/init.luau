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
    print("menuController initialized")

    self:getGui()
    playButton.MouseButton1Click:Connect(function()
        self:playOutro()
    end)
    self:playIntro()
end

function menuController:getGUI()
    playerGUI=localPlayer:WaitForChild("PlayerGui")
    mainMenu=playerGUI:WaitForChild("mainmenu")
    background=mainMenu:WaitForChild("background")
    logo=mainMenu:WaitForChild("vertislogo")
    buttons=mainMenu:WaitForChild("buttons")
    playButton=buttons:WaitForChild("playbutton")
end

function menuController:fadeObject(object, transparency, duration)
    local property

    if object:IsA("ImageLabel") or object:IsA("ImageButton") then
        property="ImageTransparency"
    elseif object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox") then
        property="TextTransparency"
    elseif object:IsA("Frame") then
        property="BackgroundTransparency"
    else
        return
    end

    local tween=tweenService:Create(
        object,
        TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            [property]=transparency
        }
    )

    tween:Play()
    tween.Completed:Wait()
end

function menuController:playIntro()
    self:fadeObject(logo, 0, introSettings.logoFade)
    task.wait(introSettings.logoDelay)
    self:fadeObject(playButton, 0, introSettings.playFade)
end

function menuController:playOutro()
    playButton.Active=false
    playButton.AutoButtonColor=false

    self:fadeObject(playButton, 1, outroSettings.playFade)
    self:fadeObject(logo, 1, outroSettings.logoFade)
    task.wait(outroSettings.backgroundDelay)
    self:fadeObject(background, 1, outroSettings.backgroundFade)
    self:destroy()
end

function menuController:destroy()
    mainMenu:Destroy()
end

return menuController