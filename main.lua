function love.load()
    love.window.setTitle("CatFood")
    love.graphics.setBackgroundColor(0,0,0)
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.window.setMode(800, 600, {fullscreen = true})
    player = love.graphics.newImage("/Sprites/Player.png")
    background = love.graphics.newImage("/Sprites/Background.png")
    width, height = love.window.getMode()
    defaultScaleX = width/192
    defaultScaleY = height/108
    speed = (defaultScaleX + defaultScaleY)*10
    playerX = width/2
    playerY = height/2
end

function love.update(dt)
    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
        playerY = playerY - speed * dt
    elseif love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        playerY = playerY + speed * dt
    end
    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        if playerX > 0 then
            playerX = playerX - speed * dt
        end
    elseif love.keyboard.isDown("d") or love.keyboard.isDown("right")then
        if playerX < width then
            playerX = playerX + speed * dt
        end
    end
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
end

function love.keypressed(key)
    if key == "e" and not menuActive then
        menuActive = true
    elseif key == "e" and menuActive then
        menuActive = false
    end
end

function love.draw()
    love.graphics.setColor(255,255,255)
    love.graphics.draw(background, 0, 0, 0, defaultScaleX, defaultScaleY)
    love.graphics.draw(player, playerX, playerY, 0, defaultScaleX/2, defaultScaleY/2, 16, 16)
    
    if menuActive then
        love.graphics.setColor(255,255,255)
        love.graphics.rectangle("fill", width/2-300, 50, width-(width/2-300)-(width/2-300), height-50-50, 50, 50)
        love.graphics.setColor(0,0,0)
        love.graphics.print("Hello", width/2, height/5)
    end
end
