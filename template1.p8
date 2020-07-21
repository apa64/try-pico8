pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- boilerplate template
-- by apa64

-- version: 1.0
--[[ MIT License

Copyright (c) 2020 Antti Ollilainen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
--]]

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
palsorted = { 0, 5, 6, 7, 15, 14, 8, 2, 4, 9, 10, 11, 3, 12, 13, 1 }

-- define sprites here - note: probably not for oop
sprites = {}
-- sprites.sprite_name = 0
-- define sounds here - note: probably not for oop
sounds = {}
-- sounds.sound_name = 0
function _init() menu_init() end

function menu_init()
  _update = menu_update
  _draw = menu_draw
end

function menu_update()
  if (btnp(b.fire1)) game_init() -- change state to play the game
end

function menu_draw()
  print("menu! ", c.green)  -- menu draw code
end

-->8
-- ######################## game

function game_init()
  _update = game_update
  _draw = game_draw
end

function game_update()
  if (btnp(b.fire1)) gameover_init() -- change state to game over
end

function game_draw()
  print("game! "..t(), c.yellow)  -- game draw code
end

-->8
-- ################### game over

function gameover_init()
  _update = gameover_update
  _draw = gameover_draw
end

function gameover_update()
  if (btnp(b.fire1)) menu_init() -- change state to back to menu
end

function gameover_draw()
  print("game over! ", c.red)  -- game over code
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
