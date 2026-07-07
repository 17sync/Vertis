local runService=game:GetService("RunService")
local players=game:GetService("Players")

local cameraController={}
local cameraPosition=Vector3.new(0, 50, -120)
local cameraTarget=Vector3.new(0, 50, 0)

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
    camera.FieldOfView=30

    rootPart=character:WaitForChild("HumanoidRootPart")

    self:setCamera(cameraPosition, cameraTarget)
end

function cameraController:setCamera(position:Vector3, target:Vector3)
    camera.CFrame=CFrame.lookAt(position, target)
end

return cameraController

