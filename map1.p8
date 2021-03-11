pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
-- map1
-- by @apa64
function _init()
  -- player
  p = {}
  p.spr = 1
  p.x = 60
  p.y = 56
  p.w = 5
  p.h = 8
  -- map
  flag_wall = 0
end

function _update()
  -- collision detection
  cell_spr = mget(0,0)
  is_wall = fget(cell_spr, flag_wall)
  if (is_wall) then
    -- cant move there
    return
  end
  -- move
  if (btn(⬅️)) p.x -= 1
  if (btn(➡️)) p.x += 1
  if (btn(⬆️)) p.y -= 1
  if (btn(⬇️)) p.y += 1
end

function _draw()
  cls(0)
  print("hello world",30,20,11)
  map(0,0,0,0,16,16)
  spr(p.spr,p.x,p.y)
end
__gfx__
00000000444440003333333333333333333333335555555500000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000041414000333333333b3b3333333666336656665600000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070044444000333333333b333333336555635555555500000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000006000003333333333b333b3365555135666566600000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000466640003333333333b333b3365555135555555500000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700006000003333333333333b33331555136656665600000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000ccc0000333333333333b333333111335555555500000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000040400003333333333333333333333335666566600000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000001010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0202020202020202020202020202020502020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020502020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202030202030202020204030202020502020402020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020502020202020202040202020302020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020204020202020302020202020502020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020502020302020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202030202020302020202020402020402020202020202020302020204020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202030202020202020302020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020402020202040202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020302020202020204020202020502020202020202020202020203020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020402020202020202020202020502020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020203020202020202020502020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202030502020202020202030202020402020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020502020302020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0505050505050505050505050505050502020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
