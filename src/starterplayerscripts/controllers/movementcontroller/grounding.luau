local states=require(script.Parent.states)

local grounding={}

local controller
local data

function grounding:init(parent)
    controller=parent
    data=parent.data
end

function grounding:update()
    local wasGrounded=data.grounded

    local params=RaycastParams.new()
    params.FilterType=Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances={data.character}

    local result=workspace:Raycast(
        data.rootPart.Position,
        Vector3.new(0, -data.movementSettings.groundCheckDistance, 0),
        params
    )

    local grounded=result~=nil
    if grounded~=wasGrounded then
        data.grounded=grounded
        if grounded then
            data.chargeDirection=0
            if states:is(data.states.jumping) or states:is(data.states.falling) then
                states:setState(data.states.landing)
            end
        else
            if states:is(data.states.walking) or states:is(data.states.idle) or states:is(data.states.charging) then
                states:setState(data.states.jumping)
            end
        end
    end
end

return grounding