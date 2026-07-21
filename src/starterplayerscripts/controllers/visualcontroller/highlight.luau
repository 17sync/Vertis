local highlight={}

local controller
local data

local playerHighlight

function highlight:init(parent)
    controller=parent
    data=parent.data

    self:create()
end

function highlight:create()
    if playerHighlight then
        playerHighlight:Destroy()
    end

    playerHighlight=Instance.new("Highlight")
    playerHighlight.Name="playerhighlight"
    playerHighlight.Adornee=data.character

    playerHighlight.FillTransparency=1
    playerHighlight.OutlineTransparency=0

    playerHighlight.FillColor=Color3.fromRGB(255, 255, 255)
    playerHighlight.OutlineColor=Color3.fromRGB(0, 0, 0)
    playerHighlight.DepthMode=Enum.HighlightDepthMode.Occluded
    
    playerHighlight.Parent=data.character
end

return highlight