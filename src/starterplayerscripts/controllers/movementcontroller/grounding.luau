local grounding={}

local controller
local data

function grounding:init(parent)
    controller=parent
    data=parent.data
end

function grounding:update()
    local result=workspace:Raycast(data.rootPart.position,
    Vector3.new(0, -data.movementSettings.groundCheckDistance, 0))

    data.grounded=result~=nil
end

return grounding