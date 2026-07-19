print("Client started!")

local controllers=script.Parent.controllers

local cameraController=require(controllers.cameracontroller)
local movementController=require(controllers.movementcontroller)
local menucontroller=require(controllers.menucontroller)
local audioController=require(controllers.audiocontroller)

cameraController:init()
movementController:init()
menucontroller:init()
audioController:init()