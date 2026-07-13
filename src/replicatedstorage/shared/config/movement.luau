-- nil means defined in method that makes use of it

data={

    -- Player
    localPlayer=game.GetService("Players").LocalPlayer,
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
    facingDirection=1,

    -- Jumping
    jumpSettings={
        minJumpPower=25,
        maxJumpPower=90,
        maxChargeTime=1.2,
        recoveryTime=0.15
    },
    jumpData={
        charging=false,
        chargeTime=0,
        chargeAlpha=0
    }
}