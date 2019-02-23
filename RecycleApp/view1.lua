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
	if points >= 20 then
		background = display.newImageRect( "perfecteco.jpg", 415, 646 )
		background.x = display.contentCenterX - 20
		background.y = display.contentCenterY - 25
	elseif points >= 10 then
		background = display.newImageRect( "middleeco.jpg", 415, 646 )
		background.x = display.contentCenterX - 20
		background.y = display.contentCenterY - 25
	else
		background = display.newImageRect( "worsteco.jpg", 415, 646 )
		background.x = display.contentCenterX - 20
		background.y = display.contentCenterY - 25
 	end

	local fish = display.newImageRect( "fish.jpg", 360, 560 )


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
