-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local background
	local fish
	if points >= 20 then
		background = display.newImageRect( "perfecteco.jpg", 415, 646 )
		background.x = display.contentCenterX - 20
		background.y = display.contentCenterY- 25
		fish = display.newImageRect( "fish.png", 60, 30 )

	elseif points >= 10 then
		background = display.newImageRect( "middleeco.jpg", 415, 646 )
		background.x = display.contentCenterX - 20
		background.y = display.contentCenterY- 25
		fish = display.newImageRect( "fish.png", 60, 30 )

	else
		background = display.newImageRect( "worsteco.jpg", 415, 646 )
		background.x = display.contentCenterX - 20
		background.y = display.contentCenterY - 25
		fish = display.newImageRect( "dead fish.png", 60, 30 )

 	end
 	fish.y = 400
 	local count = 20000
 	local back = false
	local function swim()
		count = count + 100
		if fish.x < 0 then
	    	back = false
		end
		if fish.x > display.actualContentWidth then
	    	back = true
		end
		if back == false then
	    	fish.x = fish.x + 1
		end
		if back == true then
	    	fish.x = fish.x - 1
		end
		fish.y = (math.sin(fish.x/30) * 20) + 180
		if points > 30 then
			fish.y = fish.y + (points * 10)
		end
	end

	timer.performWithDelay(10, swim, count)

	sceneGroup:insert( background )
	sceneGroup:insert( fish )

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		--
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view

	-- Called prior to the removal of scene's "view" (sceneGroup)
	--
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
