local states={}

local controller
local data

function states:init(parent)
    controller=parent
    data=parent.data
    self:setState(data.states.idle)
end

function states:setState(state)
    if data.currentState==state then 
        return
    end

    data.currentState=state
    print("State: ", state)
end

function states:getState()
    return data.currenState
end

function states:is(state)
    return data.currentState==state
end

return states