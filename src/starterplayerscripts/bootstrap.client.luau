print("Client started!")

local controllers=script.Parent.controllers

local cameraController=require(controllers.cameracontroller)
local movementController=require(controllers.movementcontroller)
local menuController=require(controllers.menucontroller)
local audioController=require(controllers.audiocontroller)

cameraController:init()
movementController:init()
audioController:init()
menuController:init()
