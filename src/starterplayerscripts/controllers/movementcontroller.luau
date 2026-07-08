local runService=game:GetService("RunService")
local players=game:GetService("Players")

local movementController={}

local localPlayer=players.LocalPlayer
local character=nil
local humanoid=nil
local rootPart=nil

local world=nil
local planeAnchor=nil
local planeAttachment=nil

function movementController:init()
    print("movementController initialized")
    
    character=localPlayer.Character or localPlayer.CharacterAdded:Wait()
    humanoid=character:WaitForChild("Humanoid")
    rootPart=character:WaitForChild("HumanoidRootPart")

    humanoid.JumpPower=0
    humanoid.UseJumpPower=true
    humanoid.WalkSpeed=0

    self:createPlaneConstraint()
end

function movementController:createPlaneConstraint()
    world=game.Workspace:WaitForChild("world")
    planeAnchor=world:WaitForChild("planeanchor")
    planeAttachment=planeAnchor:WaitForChild("planeattachment")

    local rootAttachment=Instance.new("Attachment")
    rootAttachment.Name="rootAttachment"

    local constraint=Instance.new("PlaneConstraint")
    constraint.Name="MovementPlane"

    constraint.Attachment0=rootAttachment
    constraint.Attachment1=planeAttachment

    constraint.Enabled=true

    constraint.Parent=rootPart
end

return movementController