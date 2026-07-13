local jumping={}

local controller
local data

function jumping:init(parent)
    controller=parent
    data=parent.data
end

function jumping:startCharging()
    if data.jumpData.charging then
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

    jumpData.chargeTime=math.min(jumpData.chargeTime + dt, jumpSettings.maxChargeTime)
    jumpData.chargeAlpha=jumpData.chargeTime/jumpSettings.maxChargeTime
    print(string.format("charge= %.2f", jumpData.chargeAlpha))
end

function jumping:releaseJump()
    if not data.jumpData.charging then 
        return
    end

    data.jumpData.charging=false
    print("released jump")
    print(string.format("charge strength = %.2f", data.jumpData.chargeAlpha))
end

return jumping