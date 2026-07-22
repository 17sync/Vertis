local idle={}

local controller
local data

local idleAnimId="rbxassetid://110049130712359"

function idle:init(parent)
	controller=parent
	data=parent.data

	controller:loadAnimation("idle", idleAnimId)

	local idleTrack=data.tracks.idle
	idleTrack.Looped=true
	idleTrack.Priority=Enum.AnimationPriority.Idle
end

function idle:play()
	local idleTrack=data.tracks.idle

	if idleTrack.IsPlaying then
		return
	end

	idleTrack:Play(0.15)
end

function idle:stop()
	local idleTrack=data.tracks.idle

	if not idleTrack.IsPlaying then
		return
	end

	idleTrack:Stop(0.15)
end

function idle:update(currentState)
	if currentState=="Idle" then
		self:play()
	else
		self:stop()
	end
end

return idle