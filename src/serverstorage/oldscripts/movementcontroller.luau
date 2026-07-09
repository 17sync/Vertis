-- local runService=game:GetService("RunService")
-- local userInputService=game:GetService("UserInputService")
-- local players=game:GetService("Players")

-- local movementController={}

-- local localPlayer=players.LocalPlayer
-- local character=nil
-- local humanoid=nil
-- local rootPart=nil

-- local world=nil
-- local planeAnchor=nil
-- local planeAttachment=nil

-- local states={
--     idle="Idle",
--     walking="Walking",
--     charging="Charging",
--     jumping="Jumping",
--     falling="Falling",
--     landing="Landing",
-- }
-- local currentState

-- local grounded=false
-- local movementDirection={
--     left=false,
--     right=false
-- }
-- local movementSettings={
--     walkSpeed=12,
--     rotationSpeed=12,
--     groundCheckDistance=3
-- }
-- local facingDirection=1             -- 1=left, -1=right

-- function movementController:init()
--     print("movementController initialized")
    
--     character=localPlayer.Character or localPlayer.CharacterAdded:Wait()
--     humanoid=character:WaitForChild("Humanoid")
--     rootPart=character:WaitForChild("HumanoidRootPart")

--     humanoid.JumpPower=0
--     humanoid.UseJumpPower=true
--     humanoid.AutoRotate=false
--     humanoid.WalkSpeed=0

--     self:createPlaneConstraint()
--     self:bindInput()

--     runService.Heartbeat:Connect(function(dt)
--         self:update(dt)
--     end)
-- end

-- function movementController:setState(state)
--     if currentState==state then return
--     end

--     currentState=state
--     print("State: ", state)
-- end

-- function movementController:createPlaneConstraint()
--     world=game.Workspace:WaitForChild("world")
--     planeAnchor=world:WaitForChild("planeanchor")
--     planeAttachment=planeAnchor:WaitForChild("planeattachment")

--     local rootAttachment=Instance.new("Attachment")
--     rootAttachment.Name="rootAttachment"

--     local constraint=Instance.new("PlaneConstraint")
--     constraint.Name="MovementPlane"

--     constraint.Attachment0=rootAttachment
--     constraint.Attachment1=planeAttachment
--     constraint.Enabled=true

--     constraint.Parent=rootPart
-- end

-- function movementController:bindInput()
--     userInputService.InputBegan:Connect(function(input, gameProcessed)
--         if gameProcessed then
--             return
--         end

--         if input.KeyCode==Enum.KeyCode.A then
--             movementDirection.left=true
--         elseif input.KeyCode==Enum.KeyCode.D then
--             movementDirection.right=true
--         end
--     end)

--     userInputService.InputEnded:Connect(function(input)
--         if input.KeyCode==Enum.KeyCode.A then
--             movementDirection.left=false
--         elseif input.KeyCode==Enum.KeyCode.D then
--             movementDirection.right=false
--         end
--     end)
-- end

-- function movementController:getMoveDirection()
--     if movementDirection.left and not movementDirection.right then return 1
--     elseif movementDirection.right and not movementDirection.left then return -1
--     else return 0
--     end 
-- end

-- function movementController:updateMovement(dt)
--     local root=rootPart
--     local velocity=root.AssemblyLinearVelocity
--     local direction=self:getMoveDirection()

--     root.AssemblyLinearVelocity=Vector3.new(direction*movementSettings.walkSpeed, velocity.Y, velocity.Z)
-- end

-- function movementController:updateRotation(dt)
--     local direction=self:getMoveDirection()
--     local targetYaw=nil

--     if direction==0 then return
--     end

--     if direction==1 then targetYaw=math.rad(-90)
--     else targetYaw=math.rad(90)
--     end

--     local root=rootPart
--     local position=root.Position

--     local targetCFrame=CFrame.new(position) * CFrame.Angles(0, targetYaw, 0)

--     root.CFrame=root.CFrame:Lerp(targetCFrame, dt*movementSettings.rotationSpeed)
-- end

-- function movementController:update(dt)
--     self:updateMovement(dt)
--     self:updateRotation(dt)
-- end

-- return movementController