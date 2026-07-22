local walk={}

local controller
local data

local walkAnimId="rbxassetid://96173130985061"

function walk:init(parent)
    controller=parent
    data=parent.data

    controller:loadAnimation("walk", walkAnimId)

    local walkTrack=data.tracks.walk
    walkTrack.Looped=true
    walkTrack.Priority=Enum.AnimationPriority.Movement
end

function walk:play()
    local walkTrack=data.tracks.walk

    if walkTrack.IsPlaying then
        return
    end

    walkTrack:Play(0.15)
end

function walk:stop()
    local walkTrack=data.tracks.walk

    if not walkTrack.IsPlaying then
        return
    end

    walkTrack:Stop(0.15)
end

function walk:update(currentState)
    if currentState=="Walking" then
        self:play()
    else
        self:stop()
    end
end

return walk