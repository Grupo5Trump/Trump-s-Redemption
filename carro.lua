local menu = require "menu"

local carro = { 
   quads = {}, -- tabela de sprites cortados 
   carRed = nil, --variavel com a foto sem estar cortada do sprite
   anim = 1, -- variavel animação
   tileSizeRX = 160,
   tileSizeRY = 128,
   timer = 0,
   dif = 100,
   tempo = os.time(),
   passado = 0, 
   intervalo = 5,
   xvelho = 0,
   yvelho = 0
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

function carro.spawn()
  local x = math.floor(math.random((width/4)-carro.tileSizeRX,(3*width/4)-carro.tileSizeRX))
    local y= - carro.tileSizeRY
    local dth = carro.tileSizeRX;
    local ght = carro.tileSizeRX;
  while colisao (xvelho, yvelho,dth, ght, x,y,dth,ght) do 
     x = math.floor(math.random((width/4)-carro.tileSizeRX,(3*width/4)-carro.tileSizeRX))
     y= - carro.tileSizeRY
  end
  table.insert(carro,{ x,y })
  carro.xvelho = x
  carro.yvelho = y 
end 

function carro.generator()
      tempo = os.time()
    if (tempo - carro.passado) > carro.intervalo then
      
      carro.spawn()
      carro.spawn()
      
      carro.passado = tempo
      if carro.intervalo < 0.8 then
        carro.intervalo = 3
      end
      carro.intervalo = carro.intervalo -1
    end
    

end


function carro.update(dt)

  carro.timer = os.time()
  if carro.timer % 5 == 0 then -- a cada 5 segundos a dificuldade aumenta 0.5
    carro.dif = carro.dif - 0.1
  end
  
  carro.generator()

  if carro.timer > 10 then --sprites dinamica
    if carro.anim < 7 then
      carro.anim = carro.anim + 1
    else
      carro.anim = 1
    end
    carro.timer = 0
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