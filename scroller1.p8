pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- scroller1
-- by apa

-- consts
left, right, up, down, fire1, fire2 = 0, 1, 2, 3, 4, 5
black, dark_blue, dark_purple, dark_green, brown, dark_gray, light_gray, white, red, orange, yellow, green, blue, indigo, pink, peach = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
palsorted = { 0, 5, 6, 7, 15, 14, 8, 2, 4, 9, 10, 11, 3, 12, 13, 1 }

function _init()
    pal_background = 1
    pal_text = 13
    scroller_speed = 5/30
    scroller_width = 32
    text_index = 1
    text = "12345"
    text = "lorem ipsum dolor sit amet, consectetur... " -- adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    debug = true
end

function _update()
    update_scroller_text()
    update_colour()
    update_speed()
end

function _draw()
    cls(palsorted[pal_background])
    print(scroller_text, 0, 60, palsorted[pal_text])
    if (debug) draw_debug()
end

-- updates scroller_text and text_index
-- bug: does not work properly with text shorter than scroller_width
function update_scroller_text()
    scroller_text = ""
    -- TODO: pad to start text from the right edge
    if (false and text_index < scroller_width) then
        pad = ""
        for i = 1,(scroller_width - flr(text_index)) do
            pad = pad .. "."
        end
        scroller_text = pad
    end

    text_index_end = flr(text_index + scroller_width - 1)
    scroller_text = scroller_text .. sub(text, text_index, text_index_end)

    -- add a bit from the start
    if (text_index_end > #text) then
        scroller_text = scroller_text .. sub(text, 0, text_index_end - #text)
    end

    -- +1 allows index to work through the last character at scroller_speed increments before going to 0
    text_index = ((text_index + scroller_speed) % (#text + 1))
    -- ...and fix % because index starts from 1
    if (text_index < 1) text_index = 1
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
    if (btnp(fire1)) scroller_speed = ((scroller_speed - 1/60) % 2)
    if (btnp(fire2)) scroller_speed = ((scroller_speed + 1/60) % 2)
end

-- print debug info
function draw_debug()
    print("bkg:"..pal_background..",txt:"..pal_text, 0, 117, pink)
    print("spd:"..scroller_speed..",i:"..text_index..",end:"..text_index_end, 0, 123, pink)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
