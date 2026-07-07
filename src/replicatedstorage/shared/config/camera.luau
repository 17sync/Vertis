local height=70
local FOV=70
local distance=(height/2) / math.tan(math.rad(FOV/2))
local smoothness=0.15

return { 
    height,
    FOV,
    distance,
    smoothness
}