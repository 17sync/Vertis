local grounding={}

local controller
local data

function grounding:init(parent)
    controller=parent
    data=parent.data
end

return grounding