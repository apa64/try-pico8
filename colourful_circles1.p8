pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- colourful circles
-- adapted from @zep pico-8 0.2.1 announcement by apa64

function _draw()
  cls(1)
  for i = 0, 31/32, 1/32 do
    local x=64+cos(i+t()/8)*28
    local y=64+sin(i+t()/8)*44
    local w=8+cos(i*2+t()/2)*6

    -- fillp(pattern[i*32])
    circfill(x-w, y-w, w,
      (i*32)%8+8)
  end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
