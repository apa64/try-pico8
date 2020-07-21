pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- trying out oop
-- by apa64

-- consts
b = {
  left  = 0, -- ⬅️
  right = 1, -- ➡️
  up    = 2, -- ⬆️
  down  = 3, -- ⬇️
  fire1 = 4, -- 🅾️
  fire2 = 5  -- ❎
}
c = {
  black         = 0,
  dark_blue     = 1,
  dark_purple   = 2,
  dark_green    = 3,
  brown         = 4,
  dark_gray     = 5,
  light_gray    = 6,
  white         = 7,
  red           = 8,
  orange        = 9,
  yellow        = 10,
  green         = 11,
  blue          = 12,
  indigo        = 13,
  pink          = 14,
  peach         = 15
}

local pixels = {}

function _init()
  add(pixels, pixel:new({ vx = 0.3 }))
  add(pixels, controlpixel:new({ x = 63, y = 63, color = c.red }))
  splash1 = splash:new(
    {
       x = 23, y = 23, w = 80, h = 80,
       color = c.dark_gray, text_color = c.orange,
       text = "press x to start!",
       game_start_function = "todo give game start point here!"
    }
  )
end

-- this is kind of game_update(), we need splash_update() for splash state
function _update()
  -- do thing for each element in pixels
  foreach(pixels,
    function(self)
      self:update()
    end
  )
end

--[[
function splash_draw()
  cls()
  splash1:draw()
end
--]]
function _draw()
  cls()
  splash1:draw()
  -- same kind of thing as in update but with for and all
  for p in all(pixels) do
    p:draw()
  end
end

-->8
-- ###################### entity

-- generic prototype object, kind of a class
_entity = {
  -- member vars with default values
  x = 0, -- left x
  y = 0, -- top y
  w = 0, -- width
  h = 0  -- height
}

-- the constructor creates a new object
-- params: o is an initializer table
-- https://www.lexaloffle.com/bbs/?pid=21527#p
-- inheritance: https://www.lua.org/pil/16.2.html
function _entity:new(o)
  local o = o or {} -- use initializer or create a new object if not provided
  -- a table may have an associated table called metatable (mt). the fields of the metatable are used to look up if key is not in this table.
  setmetatable(o, self)
  -- __index indicates which table is accessed when a key is not found in this. in pixel:new() call self == pixel (prototype)
  self.__index = self
  return o
end

-- checks collision with another entity with x,y,w,h
function _entity:collide(other)
  return other.x < self.x + self.w
    and self.x < other.x + other.w
    and other.y < self.y + self.h
    and self.y < other.y + other.h
end

-->8
-- ####################### pixel

-- prototype: pixel, inherited from entity
pixel = _entity:new(
  {
    w = 1,  -- width
    h = 1,  -- height
    vx = 0, -- speed x
    vy = 0, -- speed y
    color = c.white
    -- more: width, height, sprite, vmax, dvmax, friction/gravity...
  }
)

-- draws the object
function pixel:draw()
  pset(self.x, self.y, self.color)
end

-- updates the object
function pixel:update()
  self:move()
  -- check collisions
  -- interact with env
end

-- calculates new position based on speed, wrap around screen
function pixel:move()
  self.x = (self.x + self.vx) % 128
  self.y = (self.y + self.vy) % 128
end

-- prototype: controllable pixel, inherit from pixel
controlpixel = pixel:new(
  {
    dv = 0.1, -- speed change per keypress
    vmax = 1, -- max speed
    friction = 0.96 -- 0.01 -- slow down per update
  }
)

-- updates the object
function controlpixel:update()
  -- todo check collisions
  -- todo interact with env
  self:input()
  self:move()
  -- slow down, bug: does not go quite to zero
  --[[
  if (self.vx != 0) self.vx = sgn(self.vx) * (abs(self.vx) - self.friction)
  if (self.vy != 0) self.vy = sgn(self.vy) * (abs(self.vy) - self.friction)
  -- ]]
  self.vx *= self.friction
  self.vy *= self.friction
end

-- handles button presses
function controlpixel:input()
  if (btn(b.left) and abs(self.vx) < self.vmax)  self.vx -= self.dv
  if (btn(b.right) and abs(self.vx) < self.vmax) self.vx += self.dv
  if (btn(b.up) and abs(self.vy) < self.vmax)    self.vy -= self.dv
  if (btn(b.down) and abs(self.vy) < self.vmax)  self.vy += self.dv
end

-->8
-- ###################### splash

-- splash screen prototype
splash = _entity:new(
  {
    text = nil,
    color = c.light_gray,
    text_color = c.black
  }
)

-- todo handle input to go to next state
function splash:update()
  -- if (btnp(b.fire2)) game_start()
end

function splash:draw()
  rectfill(self.x, self.y, self.x + self.w, self.y + self.h, self.color)
  print(self.text, 63 - flr((#self.text - 1) * 4 / 2), 60, self.text_color)
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
