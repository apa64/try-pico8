pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
-- point to point trajectory and animation
-- by @apa64

function _init()
  l1 = { x0 = 9, y0 = 108,
    x1 = 99, y1 = 48, c = 5 }
  l2 = { x0=10, y0=110,
    x1=100, y1=50, c = 5 }
  p1 = { x = 9, y = 109, c = 8, anim_time_last = 0, anim_time_wait = 0.2}
  p2 = { x = 9, y = 110, c = 11, anim_time_last = 0, anim_time_wait = 0.05}
  dbg = ""
end

function _update()
  -- p1
  if (time() - p1.anim_time_last > p1.anim_time_wait) then
    p1.x = p1.x + 1
    p1.anim_time_last = time()
  end
  -- p2

  p2.x, p2.y = bulletvector(p2.x, p2.y, 100, 49)
  if (time() - p2.anim_time_last > p2.anim_time_wait) then
    p2.anim_time_last = time()
  end

end

function _draw()
  cls(1)
  --print(dbg, 5, 0, 14)
  line(l1.x0, l1.y0, l1.x1, l1.y1, l1.c)
  line(l2.x0, l2.y0, l2.x1, l2.y1, l2.c)
  pset(p1.x, p1.y, p1.c)
  pset(p2.x, p2.y, p2.c)
end


function bulletvector(x0, y0, x1, y1)
  -- speed per tick
  local speed = 0.5
  -- trj = trajectory
  -- trj = end_pos - start_pos
  local dx = x1 - x0
  local dy = y1 - y0
  -- distance to end_pos, c^2 = a^2 + b^2
  local dist = sqrt(dx^2 + dy^2)
  if (dist > speed) then
    local ratio = speed / dist
    local bullet_vx = dx * ratio
    local bullet_vy = dy * ratio
    xnew = bullet_vx + x0
    ynew = bullet_vy + y0
  else
    -- at the target
    xnew = x1
    ynew = y1
  end

  return xnew, ynew

  -- TODO: LERP
  -- https://gamedev.stackexchange.com/a/23433/141341
  -- 
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
