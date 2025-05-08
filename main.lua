function love.load()
    love.window.setTitle("CatFood")
    love.graphics.setBackgroundColor(0,0,0)
    love.window.setMode(800, 600)
end

function love.update()
    if love.keyboard.isDown("w") then
        love.graphics.setBackgroundColor(255,0,0)
    elseif love.keyboard.isDown("a") then
        love.graphics.setBackgroundColor(0,255,0)
    elseif love.keyboard.isDown("d") then
        love.graphics.setBackgroundColor(0,0,255)
    elseif love.keyboard.isDown("s") then
        love.graphics.setBackgroundColor(0,0,0)
    end
end
