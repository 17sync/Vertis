local jumping={}

local controller
local data

function jumping:init(parent)
    controller=parent
    data=parent.data
end

function jumping:performJump()
    local jumpSettings=data.jumpSettings
    local jumpData=data.jumpData

    local jumpPower=jumpSettings.minJumpPower + (jumpSettings.maxJumpPower - jumpSettings.minJumpPower) * jumpData.chargeAlpha
    local angle=math.rad(jumpSettings.jumpAngle)
    
    local horizontal=math.cos(angle)*jumpPower
    local vertical=math.sin(angle)*jumpPower

    horizontal*=data.facingDirection
    data.rootPart.AssemblyLinearVelocity=Vector3.new(horizontal, vertical, 0)
end

function jumping:startCharging()
    if not data.grounded then
        return
    elseif data.jumpData.charging then
        return
    end

    data.jumpData.charging=true
    data.jumpData.chargeTime=0
    print("player started charging")
end

function jumping:update(dt)
    if not data.jumpData.charging then
        return
    end

    local jumpData=data.jumpData
    local jumpSettings=data.jumpSettings

    jumpData.chargeTime+=dt

    if jumpData.chargeTime>=jumpSettings.maxChargeTime then
        jumpData.chargeTime=jumpSettings.maxChargeTime
        print(string.format("charge= %.2f", jumpData.chargeAlpha))
        jumpData.chargeAlpha=1

        self:releaseJump()
        return
    end

    jumpData.chargeAlpha=jumpData.chargeTime/jumpSettings.maxChargeTime
end

function jumping:resetCharge()
    local jumpData=data.jumpData
    
    jumpData.charging=false
    jumpData.chargeTime=0
    jumpData.chargeAlpha=0
end

function jumping:releaseJump()
    if not data.jumpData.charging then 
        return
    end
    
    local jumpData=data.jumpData
    jumpData.chargeAlpha = math.clamp(jumpData.chargeAlpha, 0, 1)
    print("released jump")

    self:performJump()
    self:resetCharge()
end

return jumping