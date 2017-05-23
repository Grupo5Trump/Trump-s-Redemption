local carro = require "carro"
local menu = require "menu"
--local pause = require "pause"

width, height = love.graphics.getDimensions()

function love.load()
   -- pause.load()
    menu.load()
    carro.load()
  love.window.setMode(800, 600)
end

function love.update(dt)
   if menu.onMenu then
     menu.update(dt)
   else
    carro.update(dt)
   -- pause.update()
  end

end

function love.draw()
   if menu.onMenu then
     menu.draw()
   else
     carro.draw()
     --pause.draw()
     end
  
  
end
