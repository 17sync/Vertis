local userInputService=game:GetService("UserInputService")
local input={}

local controller
local data

function input:init(parent)
    controller=parent
    data=parent.data
end

function input:bindInput()
    userInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end

        if input.KeyCode==Enum.KeyCode.A then
            data.movementDirection.left=true
            data.facingDirection=1
        elseif input.KeyCode==Enum.KeyCode.D then
            data.movementDirection.right=true
            data.facingDirection=-1
        elseif input.KeyCode==Enum.KeyCode.Space then
            controller.modules.jumping:startCharging()
        end
    end)

    userInputService.InputEnded:Connect(function(input)
        if input.KeyCode==Enum.KeyCode.A then
            data.movementDirection.left=false
        elseif input.KeyCode==Enum.KeyCode.D then
            data.movementDirection.right=false
        elseif input.KeyCode==Enum.KeyCode.Space then
            controller.modules.jumping:releaseJump()
        end
    end)
end

function input:getMoveDirection()
    if data.movementDirection.left and not data.movementDirection.right then return 1
    elseif data.movementDirection.right and not data.movementDirection.left then return -1
    else return 0
    end 
end

return input