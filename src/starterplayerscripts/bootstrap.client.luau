print("Client started!")

local controllers=script.Parent.controllers

local cameraController=require(controllers.cameracontroller)
local movementController=require(controllers.movementcontroller)
local menuController=require(controllers.menucontroller)
local audioController=require(controllers.audiocontroller)
local animationController=require(controllers.animationcontroller)
local visualController=require(controllers.visualcontroller)

cameraController:init()
movementController:init()
audioController:init()
visualController:init()
menuController:init()
animationController:init()
