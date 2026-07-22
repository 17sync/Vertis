local charge={}

local controller
local data

local chargeAnimId="rbxassetid://105205309644438"

function charge:init(parent)
    controller=parent
    data=parent.data

    controller:loadAnimation("charge", chargeAnimId)

    local track = data.tracks.charge
    track.Looped = true
    track.Priority = Enum.AnimationPriority.Action
end

function charge:play()
    local track=data.tracks.charge

    if track.IsPlaying then
        return
    end

    track:Play(0.15)
end

function charge:stop()
    local track=data.tracks.charge

    if not track.IsPlaying then
        return
    end

    track:Stop(0.15)
end

function charge:update(currentState)
    if currentState=="Charging" then
        self:play()
    else
        self:stop()
    end
end

return charge