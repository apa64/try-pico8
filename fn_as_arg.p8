pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
win={ w=127, h=127 }

function plot(f)
  cls(1)
  for i=0,win.w do
    -- massage data to fit win
    local x=(i/win.w)*2-1
    local y=(f(x) + 1)/2*win.h
    pset(i,y)
  end
end

-- anon function as param
plot(function(x)
  return sin(x/2)
end)

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
