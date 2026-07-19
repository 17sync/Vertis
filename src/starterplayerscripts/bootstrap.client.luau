print("Client started!")

local controllers=script.Parent.controllers

local cameraController=require(controllers.cameracontroller)
local movementController=require(controllers.movementcontroller)
local menucontroller=require(controllers.menucontroller)

cameraController:init()
movementController:init()
menucontroller:init()