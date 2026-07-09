local runService=game:GetService("RunService")
local userInputService=game:GetService("UserInputService")
local players=game:GetService("Players")

local movementController={}

local input = require(script.input)
local movement = require(script.movement)
local rotation = require(script.rotation)
local states = require(script.states)
local grounding = require(script.grounding)
local jumping = require(script.jumping)

movementController.data={

    -- Player
    localPlayer=players.LocalPlayer,
    character=nil,
    humanoid=nil,
    rootPart= nil,

    -- World
    world=nil,
    planeAnchor=nil,
    planeAttachment=nil,

    --State
    grounded=false,
    states={
        idle="Idle",
        walking="Walking",
        charging="Charging",
        jumping="Jumping",
        falling="Falling",
        landing="Landing"
    },
    currentState=nil,

    -- Input
    movementDirection={
        left=false,
        right=false
    },

    -- Settings
    movementSettings={
        walkSpeed=12,
        rotationSpeed=12,
        groundCheckDistance=3
    },

    -- Character
    facingDirection=1
}

function movementController:init()
    print("movementController initialized")
    
    local data=self.data
    
    data.character=data.localPlayer.Character or data.localPlayer.CharacterAdded:Wait()
    data.humanoid=data.character:WaitForChild("Humanoid")
    data.rootPart=data.character:WaitForChild("HumanoidRootPart")

    data.humanoid.JumpPower=0
    data.humanoid.UseJumpPower=true
    data.humanoid.AutoRotate=false
    data.humanoid.WalkSpeed=0

    self:createPlaneConstraint()
    self:bindInput()

    runService.Heartbeat:Connect(function(dt)
        self:update(dt)
    end)
end

function movementController:setState(state)
    local data=self.data

    if data.currentState==state then return
    end

    data.currentState=state
    print("State: ", state)
end

function movementController:createPlaneConstraint()
    local data=self.data

    data.world=game.Workspace:WaitForChild("world")
    data.planeAnchor=data.world:WaitForChild("planeanchor")
    data.planeAttachment=data.planeAnchor:WaitForChild("planeattachment")

    local rootAttachment=Instance.new("Attachment")
    rootAttachment.Name="rootAttachment"

    local constraint=Instance.new("PlaneConstraint")
    constraint.Name="MovementPlane"

    constraint.Attachment0=rootAttachment
    constraint.Attachment1=data.planeAttachment
    constraint.Enabled=true

    constraint.Parent=data.rootPart
end

function movementController:bindInput()
    local data=self.data
    
    userInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end

        if input.KeyCode==Enum.KeyCode.A then
            data.movementDirection.left=true
        elseif input.KeyCode==Enum.KeyCode.D then
            data.movementDirection.right=true
        end
    end)

    userInputService.InputEnded:Connect(function(input)
        if input.KeyCode==Enum.KeyCode.A then
            data.movementDirection.left=false
        elseif input.KeyCode==Enum.KeyCode.D then
            data.movementDirection.right=false
        end
    end)
end

function movementController:getMoveDirection()
    local data=self.data

    if data.movementDirection.left and not data.movementDirection.right then return 1
    elseif data.movementDirection.right and not data.movementDirection.left then return -1
    else return 0
    end 
end

function movementController:updateMovement(dt)
    local data=self.data

    local root=data.rootPart
    local velocity=root.AssemblyLinearVelocity
    local direction=self:getMoveDirection()

    root.AssemblyLinearVelocity=Vector3.new(direction*data.movementSettings.walkSpeed, velocity.Y, velocity.Z)
end

function movementController:updateRotation(dt)
    local data=self.data

    local direction=self:getMoveDirection()
    local targetYaw=nil

    if direction==0 then return
    end

    if direction==1 then targetYaw=math.rad(-90)
    else targetYaw=math.rad(90)
    end

    local root=data.rootPart
    local position=root.Position

    local targetCFrame=CFrame.new(position) * CFrame.Angles(0, targetYaw, 0)

    root.CFrame=root.CFrame:Lerp(targetCFrame, dt*data.movementSettings.rotationSpeed)
end

function movementController:update(dt)
    self:updateMovement(dt)
    self:updateRotation(dt)
end

return movementController