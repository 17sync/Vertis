local players=game:GetService("Players")

local animationController={}

animationController.modules={
    walk=require(script.walk),
    charge=require(script.charge),
    idle=require(script.idle)
}

animationController.data={
    localPlayer=players.LocalPlayer,

    character=nil,
    humanoid=nil,
    animator=nil,

    animations={},
    tracks={}
}

function animationController:init()
    local data=self.data

    data.character=data.localPlayer.Character or data.localPlayer.CharacterAdded:Wait()
    data.humanoid=data.character:WaitForChild("Humanoid")
    data.animator=data.humanoid:FindFirstChildOfClass("Animator")

    if not data.animator then
        data.animator=Instance.new("Animator")
        data.animator.Parent=data.humanoid
    end

    self.modules.idle:init(self)
    self.modules.walk:init(self)
    self.modules.charge:init(self)

    print("animationcontroller initialized")
end

function animationController:loadAnimation(name, animationId)
    local animation=Instance.new("Animation")
    animation.AnimationId=animationId

    self.data.animations[name]=animation
    self.data.tracks[name]=self.data.animator:LoadAnimation(animation)
end

function animationController:update(currentState)
    self.modules.idle:update(currentState)
    self.modules.walk:update(currentState)
    self.modules.charge:update(currentState)
end

return animationController