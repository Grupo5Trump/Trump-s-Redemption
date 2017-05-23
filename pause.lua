-- voltar pro menu inicial
-- voltar a jogar
-- instruções
width, height = love.graphics.getDimensions()
local menu = require "menu"

pause = {
  imgs={}, 
  x = width/4,
  y = height/4,
  n = 1,
  instrucao = {
      instru = false,
      instruimg = nil,
      x =  width / 4 + width/6,
      y = height/4 +  height/6
  },
  onPause = false
}


function pause.load()
  pause.instrucao.instruimg = love.graphics.newImage("Menu/Pause/inst.png") 
  for i = 1, 3 do
    pause.imgs[i] = love.graphics.newImage("Menu/Pause/pause"..i..".png") 
  end
end

function pause.update(dt)
  
 
 
end

function love.keypressed(key)

  if key == "down" and not menu.onMenu and pause.onPause then
    if pause.n < 3 then -- se o pause n estiver na ultima posiçao 
      pause.n = pause.n + 1 -- soma 1
    else
      pause.n = 1 -- caso esteja, volte pro primeiro
    end
  end
  if key == "up" and not menu.onMenu and pause.onPause then
    if pause.n > 1 then -- se o n n tiver na primeira posiçao
      pause.n = pause.n - 1 -- decresce 1 ( subindo nas opçoes ) 
    else
      pause.n = 3 -- caro esteja, volte pro ultimo 
    end
  end
  
  if key == "return" and not menu.onMenu and pause.onPause then
    if pause.n == 1 then -- voltar ao jogo
      pause.onPause = false
    elseif pause.n == 2 then
      pause.instrucao.instru = true --mostrar instruções
    else -- voltar ao menu inicial
      pause.onPause = false
      menu.onMenu = true
    end
  end

  if key == "esc" then 
   if pause.onPause and not menu.onMenu then
    if pause.instrucao.instru then  -- se apertar esc e tiver na instrucao
      pause.instrucao.instru =  false -- para de desenhar a instrucao
    end
    if not pause.instrucao.instru then -- se apertar esc e tiver no menu de pause
      pause.onPause = false -- para de desenhar o menu de pause
    end
   end
   if not menu.onMenu then
      pause.onPause = true
    end
  end

end


function pause.draw()
 if pause.onPause then 
  love.graphics.draw(pause.imgs[n], pause.x, pause.y, 0, --400x300
                    (wdith/2)/pause.imgs[menu.n]:getWidth(), (width/2)/pause.imgs[menu.n]:getHeight())
 end
 
  if pause.instrucao.instru then 
    love.graphics.draw(pause.instrucao.instruimg,
                        pause.instrucao.x, pause.instrucao.y,
                        (width/4)/pause.instrucao.instruimg:getWidth(), (height/4)/pause.instrucao.instruimg:getHeight())
  --200x150
  end

end

return pause