function love.load()
    love.window.setTitle("CatFood")
    love.graphics.setBackgroundColor(0,0,0)
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.window.setMode(800, 600, {fullscreen = true})
    --asset loading
    player = love.graphics.newImage("/Sprites/Player.png")
    background = love.graphics.newImage("/Sprites/Background.png")
    width, height = love.window.getMode()

    --16:9 aspect is used as a base for calculating scales 
    defaultScaleX = width/192
    defaultScaleY = height/108
    speed = (defaultScaleX + defaultScaleY)*10

    --[[player's scale is multiplication of the number of pixels on each side of the sprite going from the middle 
    and the division of the default scale and 2 that makes it look proportional with the background]]  
    playerX = width/2
    playerWidth = 7 * defaultScaleX/2
    playerY = height/2
    playerHeight = 15 * defaultScaleY/2
    
    --customer
    customerX = width + 30
    customerY = height/1.8

    movableXP = true
    movableXM = true
    movableYP = true
    movableYM = true
end

function love.update(dt)

    --input check
    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
        --here we have to see where are player's feet in contrast to the 45/100 line of the entire screen height 
        if playerY + playerHeight > height * 0.45 and movableYM then
            playerY = playerY - speed * dt
        end
    elseif love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        --where are player's feet in contrast to the bottom of the screen
        if playerY + playerHeight < height and movableYP then
            playerY = playerY + speed * dt
        end
    end
    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        --where is player's left hand (from our perspective) in contrast to the counter (that has it's edge on the 160 coordinate)
        if playerX - playerWidth > 160 and movableXM then
            playerX = playerX - speed * dt
        end
    elseif love.keyboard.isDown("d") or love.keyboard.isDown("right")then
        --where is player's right hand (from our perspective) in contrast to the right wall (which is at the width of the screen)
        if playerX + playerWidth < width and movableXP then
            playerX = playerX + speed * dt
        end
    end

    --customer movement
    if customerMove then
        customerX = customerX - speed * dt
    end
    if customerX <= 500 then
        customerX = 500
        customerMove = false
    end

    --quit the game
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()

    --collision check
    --[[if playerX - playerWidth < 0 + 160 and playerY - playerHeight < 460 + 160 then
        movableXM = false
    elseif playerX - playerWidth > 0 + 160 or playerY - playerHeight > 460 + 160 then
        movableXM = true 
    end]]
end

function love.keypressed(key)
    if key == "e" and not menuActive then
        menuActive = true
    elseif key == "e" and menuActive then
        menuActive = false
    end
    if key == "c" and not customerActive then
        customerActive = true
        customerMove = true
    end
end

function love.draw()
    --main game draw
    love.graphics.setColor(255,255,255)
    --bg rendering
    love.graphics.draw(background, 0, 0, 0, defaultScaleX, defaultScaleY)
    --player rendering
    love.graphics.draw(player, playerX, playerY, 0, defaultScaleX/2, defaultScaleY/2, 16, 17)
    --customer rendering
    if customerActive then
        love.graphics.draw(player, customerX, customerY, 0, defaultScaleX/2, defaultScaleY/2, 16, 17)
    end
    
    --DEBUG--    
    love.graphics.print(mouseX, 0, 0)
    love.graphics.print(mouseY, 0, 10)
    love.graphics.print(playerX, 50, 0)
    love.graphics.print(playerY, 50, 10)
    
    --menu
    if menuActive then
        love.graphics.setColor(255,255,255)
        love.graphics.rectangle("fill", width/2-300, 50, width-(width/2-300)-(width/2-300), height-50-50, 50, 50)
        love.graphics.setColor(0,0,0)
        love.graphics.print("Hello", width/2, height/5)
    end
end
