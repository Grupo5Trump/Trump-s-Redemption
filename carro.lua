local menu = require "menu"

local carro = { 
   quads = {}, -- tabela de sprites cortados 
   carRed = nil, --variavel com a foto sem estar cortada do sprite
   anim = 1, -- variavel animação
   tileSizeRX = 160,
   tileSizeRY = 128,
   timer = 0,
   dif = 100
}

function carro.loadQuads(nx, ny)
  carro.carRed = love.graphics.newImage("carro_verm.png")
  local count = 1
  for i = 0, nx-1 do
    for j = 0, ny-1 do
      carro.quads[count] = love.graphics.newQuad(i*carro.tileSizeRX,j*carro.tileSizeRY, carro.tileSizeRX, carro.tileSizeRY, carro.carRed:getWidth(), carro.carRed:getHeight())
       count = count + 1
     end
   end
end

function carro.load()
  love.graphics.setBackgroundColor(255, 255, 255)
  carro.loadQuads(3,3)
end

function carro.update(dt)

 
  carro.timer = carro.timer + 1
  if carro.timer % 0.01 == 0 then -- a cada 5 segundos a dificuldade aumenta 0.5
    carro.dif = carro.dif - 0.1
  end
  
  if carro.timer % (50/(carro.dif))^(1/2) < 0.02 then 
   table.insert(carro,{ x = math.floor(math.random((width/4)-carro.tileSizeRX,(3*width/4)-carro.tileSizeRX)),y = - carro.tileSizeRY})
  end 
  
    for i, v in ipairs(carro) do 
     v.y = v.y + 200*dt
  end

end

function carro.draw()
    --love.graphics.draw(carro.carRed, carro.quads[1], width/2, height/2)
   for i = 1 , #carro do 
     love.graphics.draw(carro.carRed, carro.quads[1], carro[i].x, carro[i].y)
   end 
  
end

return carro