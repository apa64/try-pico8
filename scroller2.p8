pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- scroller2
-- by apa64

-- right to left marquee scroller
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
left, right, up, down, fire1, fire2 = 0, 1, 2, 3, 4, 5
black, dark_blue, dark_purple, dark_green, brown, dark_gray, light_gray, white, red, orange, yellow, green, blue, indigo, pink, peach = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
palsorted = { 0, 5, 6, 7, 15, 14, 8, 2, 4, 9, 10, 11, 3, 12, 13, 1 }

function _init()
    -- palsorted index
    pal_background = 2
    pal_text = 13
    -- print location
    x = 4
    y = 60
    scroller = init_scroller("lorem ipsum dolor sit amet, consectetur... ", 30, 5/30)
    --scroller = init_scroller("lorem...", 30, 3/30)
    -- debug print
    debug = true
end

function _update()
    update_scroller()
    update_colour()
    update_speed()
    if (btnp() != 0) then
        sfx(0)
    end
end

function _draw()
    cls(palsorted[pal_background])
    print("scroller2 by apa64", 28, 2, light_gray)
    print("⬅️➡️ text color", 34, 8, light_gray)
    print("⬆️⬇️ bkg color", 36, 14, light_gray)
    print("❎🅾️ scroll speed", 30, 20, light_gray)
    draw_scroller(x, y, palsorted[pal_text])
    if (debug) draw_debug()
end

-->8
-- ######################## init

-- initializes scroller
-- params: text to print, field width in characters, scrolling speed
function init_scroller(text, width, speed)
    local scroller = {}
    scroller.speed = speed
    scroller.width = width
    scroller.pos = scroller.width   -- print start position
    scroller.text = text
    scroller.state = "init"
    scroller.i = 1
    scroller.iend = 1
    return scroller
end

-->8
-- ###################### update

-- updates scroller pos, text, i, iend
function update_scroller()
    --if (text.iend < scroller.width and text.iend < #text.t) then
    if (scroller.pos >= 1) then
        -- scrolling in from right side, not fully visible
        scroller.state = "coming in"
        scroller.pos -= scroller.speed
        if (scroller.iend < #scroller.text) scroller.iend = scroller.width - flr(scroller.pos)
    elseif (scroller.i < #scroller.text + 1) then  -- +1 to allow i to work thru last letter
        -- text on left edge, decreasing
        scroller.state = "going out"
        scroller.pos = 0
        scroller.i += scroller.speed
        if (scroller.iend < #scroller.text) scroller.iend = flr(scroller.i) + scroller.width - 1
    else
        -- reset to restart from state 1
        -- BUG: flashes once the first letter right side out of field
        scroller.state = "reset"
        scroller.pos = scroller.width
        scroller.i = 1
        scroller.iend = 1
    end
    scroller.subtext = sub(scroller.text, flr(scroller.i), flr(scroller.iend))
end

-- cycle colors with direction keys
function update_colour()
    -- add +1 because % gives 0..15 but palsorted index needs to be 1..16
    if (btnp(right)) pal_text = (pal_text % #palsorted) + 1
    -- subtract -2 because we add the +1 anyway
    if (btnp(left)) pal_text = ((pal_text - 2) % #palsorted) + 1
    if (btnp(up)) pal_background = (pal_background % #palsorted) + 1
    if (btnp(down)) pal_background = ((pal_background - 2) % #palsorted) + 1
end

-- cycle speed with fire keys
function update_speed()
    if (btnp(fire1)) scroller.speed = ((scroller.speed - 1/60) % 2)
    if (btnp(fire2)) scroller.speed = ((scroller.speed + 1/60) % 2)
end

-->8
-- ######################## draw

-- draws scroller text
-- params: x, y and color for print
function draw_scroller(x, y, color)
    print(scroller.subtext, x + flr(scroller.pos)*4, y, color)
end

-- print debug info
function draw_debug()
    print("state:"..scroller.state,0,111,red)
    print("bkg:"..pal_background..", txt:"..pal_text..", spd:"..scroller.speed, 0, 117, pink)
    print("pos:"..scroller.pos..", i:"..scroller.i..", iend:"..scroller.iend, 0, 123, pink)
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100000506007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000200000c00011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
