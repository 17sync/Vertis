local input=require(script.Parent.input)
local states=require(script.Parent.states)

local movement={}

local controller
local data

function movement:init(parent)
    controller=parent
    data=parent.data
end

function movement:updateMovement(dt)
    if not states:is(data.states.walking) and not states:is(data.states.idle) then
		return
	end

	local direction = input:getMoveDirection()
	local velocity = data.rootPart.AssemblyLinearVelocity

	data.rootPart.AssemblyLinearVelocity = Vector3.new(direction*data.movementSettings.walkSpeed, velocity.Y, 0)
end


return movement