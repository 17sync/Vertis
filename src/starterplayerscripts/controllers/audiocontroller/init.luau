local soundService=game:GetService("SoundService")

local audioController={}

audioController.background={
    windyAmbience=nil
}

audioController.sounds={
    charge=nil,
    jump=nil,
    walk=nil,
    fall=nil,
    land=nil
}

function audioController:init()
    print("audioController initialized")

    local background=self.background
    background.windyAmbience=soundService:WaitForChild("windyambience")
    
    background.windyAmbience:Play()
end

return audioController