 local menu = {
		onMenu = true, -- variavel que indica se é para estar com o menu na tela
		imgs = {}, -- array com imagens do menu
		n = 1 -- index pra array indicar se start ou exit está selecionado
}

function menu.load()
	menu.imgs[1] = love.graphics.newImage("Menu/menu(start).png") -- carrega imagem com start selecionado
	menu.imgs[2] = love.graphics.newImage("Menu/menu(exit).png") -- carrega imagem com exit selecionado
end

function menu.update(dt)
  
end

function love.keypressed(key)
  
   if key == "down" or key == "up" then -- se usuario apertar seta para cima ou para baixo
    if menu.n == 1 then -- se o menu tiver em start
      menu.n = 2 -- mude para exit
    else -- se o menu tiver em exit
      menu.n = 1 -- mude para start
    end
   end 
   
   if key == "return" then
      if menu.n == 2 then
        love.event.quit()
      else
        menu.onMenu = false
      end
   end
   
end

function menu.draw()
		love.graphics.draw(menu.imgs[menu.n],0, 0)
end

return menu
