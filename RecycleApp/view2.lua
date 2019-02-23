-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

--creates objects
function scene:create( event )
	local sceneGroup = self.view
	local background
  local bluebin
  local greybin
  local bluetext = 0
  local bluebinCount = 0
  local transpo1

--displays background
background = display.newImageRect( "recyclescreen.jpg", 720, 1120 )
background.x = display.contentCenterX
background.y = display.contentCenterY - 80

--displays bluebin
bluebin = display.newImageRect( "blue pin.png", 200, 200)
bluebin.x = display.contentCenterX - 60
bluebin.y = display.contentCenterY + 190

--displays grey bin
greybin = display.newImageRect( "grey bin.png", 200,200)
greybin.x = display.contentCenterX + 60
greybin.y = display.contentCenterY + 205

-- transpo square 1
  trans1 = display.newImageRect( "transpo square.png", 100,150)
  trans1.x = display.contentCenterX - 90
  trans1.y = display.contentCenterY + 205

-- transpo square 2
    trans2 = display.newImageRect( "transpo square 2.png", 200,150)
    trans2.x = display.contentCenterX + 90
    trans2.y = display.contentCenterY + 210

	-- track recycling text
	local title = display.newText( "Track your recycling!", display.contentCenterX, 125, native.systemFont, 32 )
	title:setFillColor( 0 )	-- black

--event listener for the bins

local function myTouchListener()
        bluebinCount = bluebinCount + 1
        bluetext.text = bluebinCount
end
  trans1:addEventListener( "tap", myTouchListener)
  trans2:addEventListener("tap", myTouchListener)
  bluetext = display.newText( bluebinCount, display.contentCenterX, 20, native.systemFont, 40 )

bluetext.x = display.contentCenterX
bluetext.y = display.contentCenterY - 70

	-- objects added to scene
	sceneGroup:insert( background )
	sceneGroup:insert( title )
  sceneGroup:insert(bluebin)
  sceneGroup:insert(greybin)
  sceneGroup:insert(bluetext)

end




--shows the scene
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

--hides the scene
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

--destorys the scene
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
