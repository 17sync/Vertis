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
    input:init(self)
    movement:init(self)
    rotation:init(self)
    states:init(self)
    grounding:init(self)
    jumping:init(self)

    input:bindInput()

    runService.Heartbeat:Connect(function(dt)
        self:update(dt)
    end)
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

function movementController:update(dt)
    movement:updateMovement(dt)
    rotation:updateRotation(dt)
end

return movementController