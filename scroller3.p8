pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- scroller3
-- by MBoffin extended by apa64
-- https://www.lexaloffle.com/bbs/?pid=78801#p
-- right to left marquee scroller
-- version: 2.0

-- consts
left, right, up, down, fire1, fire2 = 0, 1, 2, 3, 4, 5
black, dark_blue, dark_purple, dark_green, brown, dark_gray, light_gray, white, red, orange, yellow, green, blue, indigo, pink, peach = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
palsorted = { 0, 5, 6, 7, 15, 14, 8, 2, 4, 9, 10, 11, 3, 12, 13, 1 }

function _init()
    -- palsorted index
    pal_background = 2
    pal_text = 13
    speed = 10
    print_time = 0
end

function _update()
    update_colour()
    update_speed()
    if (btnp() != 0) then
        sfx(0)
    end
end

function _draw()
    cls(palsorted[pal_background])
    print("scroller3", 45, 2, light_gray)
    print("⬅️➡️ text color", 34, 8, light_gray)
    print("⬆️⬇️ bkg color", 36, 14, light_gray)
    print("❎🅾️ scroll speed", 30, 20, light_gray)

    -- draw the actual scrollers
    txtscroll("lorem ipsum dolor sit amet, consectetur... ", 4, 60, 120, speed, palsorted[pal_text])
    txtscroll("12345", 50, 70, 40, speed*2, red)
    txtscroll("secret messages from backwards records", 20, 80, 88, -speed*0.8, black)
end

-->8
-- ######################## scroller

-- draws scroller text, by MBoffin
-- note: negative speed goes backwards!
-- params: text, x, y, field width, speed px/sec, color for print
function txtscroll(text, x, y, w, speed, color)
    -- all drawing inside clip region. font height 5 px
    clip(x, y, w, 5)
    -- printable text len in px, font width 4 px. add width to get blank start.
    -- TODO: adjust for 8 px glyphs
    local len = #text * 4 + w
    -- origin x inside text 0..len, t() returns seconds since run
    local ox = (t() / (1/speed)) % len
    -- print x goes actually from end of field to start?! and clip limits printing. wow.
    print(text, x + w - ox, y, color)
    -- reset clip to fullscreen
    clip()

    -- print("spd:"..speed..", t:"..flr(t())..", ox:"..ox, 0, 117, pink)
    -- print("w:"..w..", len:"..len, 0, 123, pink)
end

-->8
-- ###################### update

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
    if (btnp(fire1)) speed = ((speed - 1) % 101)
    if (btnp(fire2)) speed = ((speed + 1) % 101)
end

-->8
-- ######################## draw


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
