local jump={}

local controller
local data

local jumpAnimId="rbxassetid://95727896991778"

function jump:init(parent)
	controller=parent
	data=parent.data

	controller:loadAnimation("jump", jumpAnimId)

	local jumpTrack=data.tracks.jump
	jumpTrack.Looped=false
	jumpTrack.Priority=Enum.AnimationPriority.Action
end

function jump:play()
	local jumpTrack=data.tracks.jump

	if jumpTrack.IsPlaying then
		return
	end

	jumpTrack:Play(0.05)
end

function jump:stop()
	local jumpTrack=data.tracks.jump

	if not jumpTrack.IsPlaying then
		return
	end

	jumpTrack:Stop(0.05)
end

function jump:update(currentState)
	if currentState=="Jumping" then
		self:play()
	else
		self:stop()
	end
end

return jump