local carro = require "carro"
local menu = require "menu"
local pause = require "pause"
--local rua = require "rua"

width, height = love.graphics.getDimensions()

function love.load()
    menu.load()
    carro.load()
    pause.load()
    --rua.load()
  love.window.setMode(800, 600)
end

function love.update(dt)
   if menu.onMenu then
     menu.update(dt)
   else
    --pause.update(dt)
    if not pause.onPause then
      carro.update(dt)
    end
    --rua.update(dt)
  end

end

function love.draw()
  love.graphics.setColor(255,255,255)
  if menu.onMenu then
   menu.draw()
  else
   --rua.draw()
   carro.draw() 
   pause.draw()
  end

end
 
 function colisao(x1,y1,w1,h1, x2,y2,w2,h2) 
  if x1 + w1 > x2 and x1 < x2 + w2 and y1 + h1 > y2 and y1 < y2 + h2 then
    return true
  end
end

 
 
 function love.keypressed(key)
   
   
  if key == "down" then
  
    if menu.onMenu then -- MAIN MENU
      if menu.n == 1 then -- se o menu tiver em start
        menu.n = 2 -- mude para exit
      else -- se o menu tiver em exit
        menu.n = 1 -- mude para start
      end
    end
  
    if not menu.onMenu and pause.onPause and not pause.instrucao.instru then -- PAUSE MENU
      if pause.n < 3 then -- se o pause n estiver na ultima posiçao 
        pause.n = pause.n + 1 -- soma 1
      else
        pause.n = 1 -- caso esteja, volte pro primeiro
      end
    end
    
  end
  
  if key == "up"  then
    
  if menu.onMenu then -- MAIN MENU
     if menu.n == 1 then -- se o menu tiver em start
      menu.n = 2 -- mude para exit
    else -- se o menu tiver em exit
      menu.n = 1 -- mude para start
    end
  end
  
  
  if not menu.onMenu and pause.onPause and not pause.instrucao.instru then -- PAUSE MENU
      if pause.n > 1 then -- se o n n tiver na primeira posiçao
        pause.n = pause.n - 1 -- decresce 1 ( subindo nas opçoes ) 
      else
        pause.n = 3 -- caro esteja, volte pro ultimo 
      end
    end
  
  end
  
  
  if key == "return"  then
    
   if menu.onMenu then -- MAIN MENU
      if menu.n == 2 then
        love.event.quit()
      else
        menu.onMenu = false
      end
    end
   
   if not menu.onMenu and pause.onPause then -- PAUSE MENU
      if pause.n == 1 then -- voltar ao jogo
        pause.onPause = false
      elseif pause.n == 2 then
        pause.instrucao.instru = true --mostrar instruções
      else -- voltar ao menu inicial
        pause.onPause = false
        menu.onMenu = true
      end
    end
    
  end
  

  if key == "escape" then 
   
   if not menu.onMenu and not pause.onPause then -- PAUSE MENU
      pause.onPause = true
    end
   
   if pause.instrucao.instru then
     pause.instrucao.instru = false
   end
   

   
   
   --[[if pause.onPause and not menu.onMenu then -- PAUSE MENU
    if pause.instrucao.instru then  -- se apertar esc e tiver na instrucao
      pause.instrucao.instru =  false -- para de desenhar a instrucao
    else-- se apertar esc e tiver no menu de pause
      pause.onPause = false -- para de desenhar o menu de pause
    end
   end]]
   
  end
  
  
  
end
