local runService=game:GetService("RunService")
local players=game:GetService("Players")

local cameraController={}

local visibleHeight=70
local fieldOfView=30
local cameraTarget=Vector3.new(0, 0, 0)

local localPlayer=players.LocalPlayer
local camera=nil
local character=nil
local rootPart=nil

function cameraController:init()
    print("cameraController initialized")
    
    character=localPlayer.Character or localPlayer.CharacterAdded:Wait()
    character:WaitForChild("Humanoid")

    camera=game.Workspace.CurrentCamera
    camera.CameraType=Enum.CameraType.Scriptable
    camera.FieldOfView=fieldOfView

    rootPart=character:WaitForChild("HumanoidRootPart")

    self:setCamera(cameraTarget)
end 

function cameraController:setCamera(target:Vector3)
    local distance=(visibleHeight/2) / math.tan(math.rad(fieldOfView/2))
    
    local position=target + Vector3.new(0, 0, -distance)

    camera.CFrame=CFrame.lookAt(position, target)
end

return cameraController

