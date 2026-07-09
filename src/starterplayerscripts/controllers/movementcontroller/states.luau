local states={}

local controller
local data

function states:init(parent)
    controller=parent
    data=parent.data
end

function states:setState(state)
    if data.currentState==state then return
    end

    data.currentState=state
    print("State: ", state)
end

return states