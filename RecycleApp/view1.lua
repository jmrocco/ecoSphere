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
 	local count = 99999999999999999999999999999999
 	local back = false
 	local back2 = false
	local background
	local fish, fish2
	local can = display.newImageRect( "transpo square.jpg", 0, 0 )
	local can2 = display.newImageRect( "transpo square.jpg", 0, 0 )
	local can3 = display.newImageRect( "transpo square.jpg", 0, 0 )
	local bottle = display.newImageRect( "transpo square.jpg", 0, 0 )
	local bottle2 = display.newImageRect( "transpo square.jpg", 0, 0 )

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
		can2 =  display.newImageRect( "can.png", 20, 40 )
		can2.x = display.contentCenterX + 100
		can2.y = display.contentCenterY - 10
		bottle2 =  display.newImageRect( "bottle.png", 20, 40 )
		bottle2.x = display.contentCenterX + 50
		bottle2.y = display.contentCenterY + 5
		can3 =  display.newImageRect( "can.png", 20, 40 )
		can3.x = display.contentCenterX - 100
		can3.y = display.contentCenterY + 30

	else
		background = display.newImageRect( "worsteco.jpg", 415, 646 )
		background.x = display.contentCenterX - 20
		background.y = display.contentCenterY - 25
		fish = display.newImageRect( "dead fish.png", 60, 30 )
		fish2 = display.newImageRect( "dead fish.png", 60, 30 )
		can =  display.newImageRect( "can.png", 20, 40 )
		can.x = display.contentCenterX
		can.y = display.contentCenterY
		bottle =  display.newImageRect( "bottle.png", 20, 40 )
		bottle.x = display.contentCenterX - 50
		bottle.y = display.contentCenterY - 20
		can2 =  display.newImageRect( "can.png", 20, 40 )
		can2.x = display.contentCenterX + 100
		can2.y = display.contentCenterY - 10
		bottle2 =  display.newImageRect( "bottle.png", 20, 40 )
		bottle2.x = display.contentCenterX + 50
		bottle2.y = display.contentCenterY + 5
		can3 =  display.newImageRect( "can.png", 20, 40 )
		can3.x = display.contentCenterX - 100
		can3.y = display.contentCenterY + 30

 	end
 	fish2.x = 100
 	fish.y = 400
 	fish2.y = 450

	local function swim()
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

		fish.y = (math.sin(fish.x/30) * 20) + 180
		if points < 30 then
			fish.y = fish.y + (points * 10)
		else
			fish.y = fish.y + 300
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
		fish2.y = (math.sin(fish2.x/30) * 20) + 180
		if points < 30 then
			fish2.y = fish2.y + (points * 5)
		else
			fish2.y = fish2.y + 300
		end
	end

	timer.performWithDelay(10, swim, count)
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
