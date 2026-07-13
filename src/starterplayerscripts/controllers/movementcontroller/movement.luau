local input=require(script.Parent.input)
local movement={}

local controller
local data

function movement:init(parent)
    controller=parent
    data=parent.data
end

function movement:updateMovement(dt)
    if data.jumpData.charging then
        data.rootPart.AssemblyLinearVelocity=Vector3.new(0, data.rootPart.AssemblyLinearVelocity.Y, 0)
        return
    end
    
    local root=data.rootPart
    local velocity=root.AssemblyLinearVelocity
    local direction=input:getMoveDirection()

    root.AssemblyLinearVelocity=Vector3.new(direction*data.movementSettings.walkSpeed, velocity.Y, velocity.Z)
end


return movement