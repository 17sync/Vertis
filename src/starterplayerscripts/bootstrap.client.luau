print("Client started!")

local controllers=script.Parent.controllers

local cameraController=require(controllers.cameracontroller)
local movementController=require(controllers.movementcontroller)

cameraController:init()
movementController:init()