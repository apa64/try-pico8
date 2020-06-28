pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- template
-- by apa

-- consts
left, right, up, down, fire1, fire2 = 0, 1, 2, 3, 4, 5
black, dark_blue, dark_purple, dark_green, brown, dark_gray, light_gray, white, red, orange, yellow, green, blue, indigo, pink, peach = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
palsorted = { 0, 5, 6, 7, 15, 14, 8, 2, 4, 9, 10, 11, 3, 12, 13, 1 }

function _init() menu_init() end

function menu_init()
    _update = menu_update
    _draw = menu_draw
end

function menu_update()
    if (btnp(🅾️)) game_init() -- play the game
end

function menu_draw()
    print("menu!")  -- menu draw code
end

-->8
-- ######################## game

function game_init()
    _update = game_update
    _draw = game_draw
end

function game_update()
    if (btnp(🅾️)) gameover_init() -- game over
end

function game_draw()
    print("game!")  -- game draw code
end

-->8
-- ################### game over

function gameover_init()
    _update = gameover_update
    _draw = gameover_draw
end

function gameover_update()
    if (btnp(🅾️)) menu_init() -- back to menu
end

function gameover_draw()
    print("game over!")  -- game over code
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
