print("Client started!")

local controllers=script.Parent.controllers

local cameraController=require(controllers.cameracontroller)
cameraController:init()