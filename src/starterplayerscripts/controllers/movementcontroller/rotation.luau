local input=require(script.Parent.input)
local rotation={}

local controller
local data

function rotation:init(parent)
    controller=parent
    data=parent.data
end

function rotation:updateRotation(dt)
    local direction=input:getMoveDirection()
    local targetYaw=nil

    if direction==0 then return
    end

    if direction==1 then targetYaw=math.rad(-90)
    else targetYaw=math.rad(90)
    end

    local root=data.rootPart
    local position=root.Position

    local targetCFrame=CFrame.new(position) * CFrame.Angles(0, targetYaw, 0)

    root.CFrame=root.CFrame:Lerp(targetCFrame, dt*data.movementSettings.rotationSpeed)
end


return rotation