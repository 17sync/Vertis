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
local settingsButton=nil
local patchNotesButton=nil

local introSettings={
    logoFade=2.0,
    buttonFade=0.6,
    logoDelay=3.5,
    buttonDelay=1.2
}

local outroSettings={
    buttonFade=0.25,
    logoFade=1.2,
    backgroundFade=3.5,
    backgroundDelay=0.2
}

function menuController:init()
    print("menuController initialized")

    self:getGUI()
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
    settingsButton=buttons:WaitForChild("settingsbutton")
    patchNotesButton=buttons:WaitForChild("patchnotesbutton")
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
    task.wait(introSettings.logoDelay)
    self:fadeObject(logo, 0, introSettings.logoFade)
    task.wait(introSettings.buttonDelay)
    self:fadeObject(playButton, 0, introSettings.buttonFade)
    self:fadeObject(settingsButton, 0, introSettings.buttonFade)
    self:fadeObject(patchNotesButton, 0, introSettings.buttonFade)
end

function menuController:playOutro()
    playButton.Active=false
    playButton.AutoButtonColor=false

    self:fadeObject(playButton, 1, outroSettings.buttonFade)
    self:fadeObject(settingsButton, 1, outroSettings.buttonFade)
    self:fadeObject(patchNotesButton, 1, outroSettings.buttonFade)
    self:fadeObject(logo, 1, outroSettings.logoFade)
    task.wait(outroSettings.backgroundDelay)
    self:fadeObject(background, 1, outroSettings.backgroundFade)
    self:destroy()
end

function menuController:destroy()
    mainMenu:Destroy()
end

return menuController