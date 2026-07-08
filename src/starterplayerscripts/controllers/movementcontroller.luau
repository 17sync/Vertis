local runService=game:GetService("RunService")
local userInputService=game:GetService("UserInputService")
local players=game:GetService("Players")

local movementController={}

local localPlayer=players.LocalPlayer
local character=nil
local humanoid=nil
local rootPart=nil

local world=nil
local planeAnchor=nil
local planeAttachment=nil

local moveDirection=0           -- -1 = left, 0 = standing, 1 = right
local movementSettings={
    walkSpeed=14
}

function movementController:init()
    print("movementController initialized")
    
    character=localPlayer.Character or localPlayer.CharacterAdded:Wait()
    humanoid=character:WaitForChild("Humanoid")
    rootPart=character:WaitForChild("HumanoidRootPart")

    humanoid.JumpPower=0
    humanoid.UseJumpPower=true
    humanoid.AutoRotate=false
    humanoid.WalkSpeed=0

    self:createPlaneConstraint()
    self:bindInput()

    runService.Heartbeat:Connect(function(dt)
        self:update(dt)
    end)
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

function movementController:bindInput()
    userInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end

        if input.KeyCode==Enum.KeyCode.A then
            moveDirection=-1
        elseif input.KeyCode==Enum.KeyCode.D then
            moveDirection=1
        end
    end)

    userInputService.InputEnded:Connect(function(input)
        if input.KeyCode==Enum.KeyCode.A then
            moveDirection=0
        elseif input.KeyCode==Enum.KeyCode.D then
            moveDirection=0
        end
    end)
end

function movementController:update(dt)
    local root=rootPart
    local velocity=root.AssemblyLinearVelocity

    root.AssemblyLinearVelocity=Vector3.new(moveDirection * movementSettings.walkSpeed, velocity.Y, velocity.Z)
end

return movementController