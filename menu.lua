 width, height = love.graphics.getDimensions()
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


function menu.draw()
		love.graphics.draw(menu.imgs[menu.n], 0, 0, 0, width/menu.imgs[menu.n]:getWidth(), height/menu.imgs[menu.n]:getHeight())
end

return menu
