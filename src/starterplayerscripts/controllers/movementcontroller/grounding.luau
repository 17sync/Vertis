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

    local result=workspace:Raycast(data.rootPart.position,
    Vector3.new(0, -data.movementSettings.groundCheckDistance, 0))

    local grounded=result~=nil

    if data.grounded and not wasGrounded then
        data.lockedDirection=0
    end

    if grounded~=data.grounded then 
        data.grounded=grounded

        if grounded then
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