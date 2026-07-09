local jumping={}

local controller
local data

function jumping:init(parent)
    controller=parent
    data=parent.data
end

return jumping