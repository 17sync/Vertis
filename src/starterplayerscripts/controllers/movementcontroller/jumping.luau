local states=require(script.Parent.states)
local input=require(script.Parent.input)

local jumping={}

local controller
local data

function jumping:init(parent)
    controller=parent
    data=parent.data
end

function jumping:performJump()
	local jumpSettings=data.jumpSettings
	local alpha=data.jumpData.chargeAlpha

	local horizontalVelocity=jumpSettings.minHorizontalSpeed +
		(jumpSettings.maxHorizontalSpeed-jumpSettings.minHorizontalSpeed)*alpha

	local verticalVelocity=jumpSettings.minVerticalSpeed +
		(jumpSettings.maxVerticalSpeed-jumpSettings.minVerticalSpeed)*alpha

	horizontalVelocity*=data.chargeDirection

	data.rootPart.AssemblyLinearVelocity=Vector3.new(horizontalVelocity, verticalVelocity, 0)

    print("Jumping Direction:", data.chargeDirection)
end

function jumping:startCharging()
    if not data.grounded then
        return
    end
    if states:is(data.states.charging) then
        return
    end

    data.chargeDirection=input:getMoveDirection()
    states:setState(data.states.charging)
    data.jumpData.charging=true
    data.jumpData.chargeTime=0
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
    
    states:setState(data.states.jumping)
    self:performJump()
    self:resetCharge()
end

return jumping