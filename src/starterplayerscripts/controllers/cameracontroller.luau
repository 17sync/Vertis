local players=game:GetService("Players")
local localPlayer=players.LocalPlayer

local cameraController={}

function cameraController:init()
    print("cameraController initialized")
    local character=localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local rootPart=character:WaitForChild("HumanoidRootPart")

    local camera=game.Workspace.CurrentCamera
    camera.CameraType=Enum.CameraType.Scriptable
end

return cameraController
