local userInputService=game:GetService("UserInputService")
local states=require(script.Parent.states)

local input={}

local controller
local data

function input:init(parent)
    controller=parent
    data=parent.data
end

function input:getMoveDirection()
    if data.movementDirection.left and not data.movementDirection.right then return 1
    elseif data.movementDirection.right and not data.movementDirection.left then return -1
    else return 0
    end 
end

function input:bindInput()
    userInputService.InputBegan:Connect(function(Input, gameProcessed)
        if gameProcessed then
            return
        end

        if Input.KeyCode==Enum.KeyCode.A then
            data.movementDirection.left=true
            if states:is(data.states.charging) then
                data.chargeDirection=1
            else
                data.facingDirection=1
                if data.grounded then
                    states:setState(data.states.walking)
                end
            end
        elseif Input.KeyCode==Enum.KeyCode.D then
            data.movementDirection.right=true
            if states:is(data.states.charging) then
                data.chargeDirection=-1
            else
                data.facingDirection=-1
                if data.grounded then
                    states:setState(data.states.walking)
                end
            end
        elseif Input.KeyCode==Enum.KeyCode.Space then
            controller.modules.jumping:startCharging()
        end
    end)

    userInputService.InputEnded:Connect(function(Input)
        if Input.KeyCode==Enum.KeyCode.A then
            data.movementDirection.left=false
            if input:getMoveDirection()==0 and data.grounded then
	            states:setState(data.states.idle)
            end
        elseif Input.KeyCode==Enum.KeyCode.D then
            data.movementDirection.right=false
            if input:getMoveDirection()==0 and data.grounded then
	            states:setState(data.states.idle)
            end
        elseif Input.KeyCode==Enum.KeyCode.Space then
            controller.modules.jumping:releaseJump()
        end
    end)
end

return input