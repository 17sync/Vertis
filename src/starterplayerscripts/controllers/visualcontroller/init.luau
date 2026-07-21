local players=game:GetService("Players")

local visualController={}

visualController.modules={
    highlight=require(script.highlight)
}

visualController.data={
    localPlayer=players.LocalPlayer,
    character=nil
}

function visualController:init()
    local data=self.data
    data.character=data.localPlayer.Character or data.localPlayer.CharacterAdded:Wait()

    self.modules.highlight:init(self)
end

return visualController