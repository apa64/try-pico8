pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- try move speeds
-- by apa
function _init()
  speed = 5
  x = 5
  y = 64
end

function _draw()
  cls(5)
  circ(x,y,2,15)
  pset(x,y,8)
  print("x="..x..", s="..speed,2,5,14)
end

function _update()
  if (btn(➡️)) x += speed
  if (btnp(⬆️)) speed += 1
  if (btnp(⬇️)) then
    if (speed > 1) speed -= 1
    if (speed <= 1) speed -= 0.1
  end
  speed %= 10
  x %= 128
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000