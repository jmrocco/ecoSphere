-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

--creates objects for the scene
function scene:create( event )
  local sceneGroup = self.view
  local background, bluebin, greybin, trans1,trans2
  local counterText = 0
  local count = 0


  --displays backgrounds
  background = display.newImageRect( "recyclescreen.jpg", 720, 1120 )
  background.x = display.contentCenterX
  background.y = display.contentCenterY - 80

  --displays bluebin
  bluebin = display.newImageRect( "blue bin.png", 200, 200)
  bluebin.x = display.contentCenterX - 60
  bluebin.y = display.contentCenterY + 190

  --displays grey bin
  greybin = display.newImageRect( "grey bin.png", 200, 200)
  greybin.x = display.contentCenterX + 60
  greybin.y = display.contentCenterY + 205

  -- button to click blue bin
  trans1 = display.newImageRect( "blue bin button.png", 100, 150)
  trans1.x = display.contentCenterX - 90
  trans1.y = display.contentCenterY + 205

  -- button to click grey bin
  trans2 = display.newImageRect( "grey bin button.png", 200, 150)
  trans2.x = display.contentCenterX + 90
  trans2.y = display.contentCenterY + 210

  -- track recycling text
  local title = display.newText( "Track your recycling!", display.contentCenterX, 125, native.systemFont, 32 )
  title:setFillColor( 0 ) -- black

  --event to trigger count for bins
  local function myTouchListener()
    count = count + 1
    points = count
    counterText.text = count
  end

  -- event listeners for touch input on bins
  trans1:addEventListener( "tap", myTouchListener)
  trans2:addEventListener("tap", myTouchListener)

  -- updates the counter
  counterText = display.newText( count, display.contentCenterX, 20, native.systemFont, 40 )
  counterText.x = display.contentCenterX
  counterText.y = display.contentCenterY - 70

  -- objects added to scene
  sceneGroup:insert( background)
  sceneGroup:insert( title )
  sceneGroup:insert(bluebin)
  sceneGroup:insert(greybin)
  sceneGroup:insert(counterText)
  sceneGroup:insert(trans1)
  sceneGroup:insert(trans2)

end




--shows the scene
function scene:show( event )
  local sceneGroup = self.view
  local phase = event.phase

  if phase == "will" then
    -- Called when the scene is still off screen and is about to move on screen
  elseif phase == "did" then
    -- Called when the scene is now on screen
  end
end

--hides the scene
function scene:hide( event )
  local sceneGroup = self.view
  local phase = event.phase

  if event.phase == "will" then
    -- Called when the scene is on screen and is about to move off screen
  elseif phase == "did" then
    -- Called when the scene is now off screen
  end
end

--destorys the scene
function scene:destroy( event )
  local sceneGroup = self.view

  -- Called prior to the removal of scene's "view" (sceneGroup)
end

---------------------------------------------------------------------------------

-- Listener setup to construct the scene
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
