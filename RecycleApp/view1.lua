-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------


local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	content()
end

function scene:show( event )
	content()
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

function content()

	local sceneGroup = scene.view
	local scoreText = display.newText(points, display.contentCenterX, 20, native.systemFont, 60 )
 	local count = 999999999999999999999999999999999999999999
 	local back = false
 	local back2 = false
 	local garbageUp = false
	local background
	local fish, fish2
	local can = display.newImageRect( "blue bin button.png", 0, 0 )
	local can2 = display.newImageRect( "blue bin button.png", 0, 0 )
	local can3 = display.newImageRect( "blue bin button.png", 0, 0 )
	local bottle = display.newImageRect( "blue bin button.png", 0, 0 )
	local bottle2 = display.newImageRect( "blue bin button.png", 0, 0 )

	if points >= 20 then
		background = display.newImageRect( "perfecteco.jpg", 415, 646 )
		background.x = display.contentCenterX - 20
		background.y = display.contentCenterY- 25
		fish = display.newImageRect( "fish.png", 60, 30 )
		fish2 = display.newImageRect( "fish.png", 60, 30 )

	elseif points >= 10 then
		background = display.newImageRect( "middleeco.jpg", 415, 646 )
		background.x = display.contentCenterX - 20
		background.y = display.contentCenterY- 25
		fish = display.newImageRect( "fish.png", 60, 30 )
		fish2 = display.newImageRect( "dead fish.png", 60, 30 )
		can =  display.newImageRect( "can.png", 20, 40 )
		can.x = display.contentCenterX
		can.y = display.contentCenterY - 55
		bottle2 =  display.newImageRect( "bottle.png", 20, 40 )
		bottle2.x = display.contentCenterX + 50
		bottle2.y = display.contentCenterY - 30
		can3 =  display.newImageRect( "can.png", 20, 40 )
		can3.x = display.contentCenterX - 130
		can3.y = display.contentCenterY - 50

	else
		background = display.newImageRect( "worsteco.jpg", 415, 646 )
		background.x = display.contentCenterX - 20
		background.y = display.contentCenterY - 25
		fish = display.newImageRect( "dead fish.png", 60, 30 )
		fish2 = display.newImageRect( "dead fish.png", 60, 30 )
		can =  display.newImageRect( "can.png", 20, 40 )
		can.x = display.contentCenterX
		can.y = display.contentCenterY - 55
		bottle =  display.newImageRect( "bottle.png", 20, 40 )
		bottle.x = display.contentCenterX - 60
		bottle.y = display.contentCenterY - 40
		can2 =  display.newImageRect( "can.png", 20, 40 )
		can2.x = display.contentCenterX + 100
		can2.y = display.contentCenterY - 40
		bottle2 =  display.newImageRect( "bottle.png", 20, 40 )
		bottle2.x = display.contentCenterX + 50
		bottle2.y = display.contentCenterY - 30
		can3 =  display.newImageRect( "can.png", 20, 40 )
		can3.x = display.contentCenterX - 130
		can3.y = display.contentCenterY - 50

 	end

	fish2.x = 250

	local function swim()

		--Flip fish at sides of screen and move horizontally
		if fish.x < 0 then
	    	back = false
		end
		if fish.x > display.actualContentWidth then
	    	back = true
	    	fish.xScale = -1
		end
		if back == false then
	    	fish.x = fish.x + 1
	    	fish.xScale = 1
		end
		if back == true then
	    	fish.x = fish.x - 1
		end

		if fish2.x < 0 then
	    	back2 = false
		end
		if fish2.x > display.actualContentWidth then
	    	back2 = true
	    	fish2.xScale = -1
		end
		if back2 == false then
	    	fish2.x = fish2.x + 1
	    	fish2.xScale = 1
		end
		if back2 == true then
	    	fish2.x = fish2.x - 1
		end

		--Move fish vertically
		fish.y = (math.sin(fish.x/30 + 50) * 20) + 300
		fish2.y = (math.sin(fish2.x/30) * 20) + 400
	end

	local function garbageAnimation()

		--Move garbage
		if can.y > display.contentCenterY - 55 then
			garbageUp = false
		end
		if can.y < display.contentCenterY - 70 then
			garbageUp = true
		end
		if garbageUp == false then
			can.y = can.y - 1
			bottle.y = bottle.y + 1
			can2.y = can2.y - 1
			bottle2.y = bottle2.y + 1
			can3.y = can3.y + 1

			can.x = can.x + 1
			bottle.x = bottle.x + 1
			can2.x = can2.x + 1
			bottle2.x = bottle2.x - 1
			can3.x = can3.x + 1
		end
		if garbageUp == true then
			can.y = can.y + 1
			bottle.y = bottle.y - 1
			can2.y = can2.y + 1
			bottle2.y = bottle2.y - 1
			can3.y = can3.y - 1

			can.x = can.x - 1
			bottle.x = bottle.x - 1
			can2.x = can2.x - 1
			bottle2.x = bottle2.x + 1
			can3.x = can3.x - 1
		end
	end

	timer.performWithDelay(10, swim, count)
	timer.performWithDelay(50, garbageAnimation, count)
	scoreText:setFillColor( 0, 0, 0 )

	sceneGroup:insert( background )
	sceneGroup:insert( fish )
	sceneGroup:insert( fish2 )
	sceneGroup:insert( can )
	sceneGroup:insert( can2 )
	sceneGroup:insert( can3 )
	sceneGroup:insert( bottle )
	sceneGroup:insert( bottle2 )
	sceneGroup:insert( scoreText )
end

return scene
