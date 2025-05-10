function love.load()
    love.window.setTitle("CatFood")
    love.graphics.setBackgroundColor(0,0,0)
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.window.setMode(800, 600, {fullscreen = true})
    --asset loading
    player = love.graphics.newImage("/Sprites/Player.png")
    background = love.graphics.newImage("/Sprites/Background.png")
    width, height = love.window.getMode()
    defaultScaleX = width/192
    defaultScaleY = height/108
    speed = (defaultScaleX + defaultScaleY)*10
    playerX = width/2
    playerWidth = 7 * defaultScaleX/2
    playerY = height/2
    playerHeight = 15 * defaultScaleY/2
    movableXP = true
    movableXM = true
    movableYP = true
    movableYM = true
end

function love.update(dt)

    --input check
    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
        if playerY + playerHeight > height * 0.45 and movableYM then
            playerY = playerY - speed * dt
        end
    elseif love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        if playerY + playerHeight < height and movableYP then
            playerY = playerY + speed * dt
        end
    end
    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        if playerX - playerWidth > 160 and movableXM then
            playerX = playerX - speed * dt
        end
    elseif love.keyboard.isDown("d") or love.keyboard.isDown("right")then
        if playerX + playerWidth < width and movableXP then
            playerX = playerX + speed * dt
        end
    end
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
end

function love.draw()
    --main game draw
    love.graphics.setColor(255,255,255)
    love.graphics.draw(background, 0, 0, 0, defaultScaleX, defaultScaleY)
    love.graphics.draw(player, playerX, playerY, 0, defaultScaleX/2, defaultScaleY/2, 16, 17)
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
