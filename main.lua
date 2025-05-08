function love.load()
    love.window.setTitle("CatFood")
    love.graphics.setBackgroundColor(0,0,0)
    love.window.setMode(800, 600, {fullscreen = true})
    speed = 100
    width, height = love.window.getMode()
    playerX = width/2
    playerY = height/2
end

function love.update(dt)
    if love.keyboard.isDown("w") then
        playerY = playerY - speed * dt
    elseif love.keyboard.isDown("s") then
        playerY = playerY + speed * dt
    end
    if love.keyboard.isDown("a") then
        playerX = playerX - speed * dt
    elseif love.keyboard.isDown("d") then
        playerX = playerX + speed * dt
    end
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
end
function love.draw()
    love.graphics.rectangle("fill", playerX-25, playerY-50, 50, 100)
    love.graphics.print(height)
end
