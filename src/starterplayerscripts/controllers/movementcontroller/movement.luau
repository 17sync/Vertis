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
    local velocity = data.rootPart.AssemblyLinearVelocity

    if states:is(data.states.walking) then
        local direction = input:getMoveDirection()
        data.rootPart.AssemblyLinearVelocity = Vector3.new(direction*data.movementSettings.walkSpeed, velocity.Y, 0)
    elseif states:is(data.states.idle) then
        data.rootPart.AssemblyLinearVelocity=Vector3.new(0, velocity.Y, 0)
    end
end


return movement