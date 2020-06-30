pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- scroller2
-- by apa

-- consts
left, right, up, down, fire1, fire2 = 0, 1, 2, 3, 4, 5
black, dark_blue, dark_purple, dark_green, brown, dark_gray, light_gray, white, red, orange, yellow, green, blue, indigo, pink, peach = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
palsorted = { 0, 5, 6, 7, 15, 14, 8, 2, 4, 9, 10, 11, 3, 12, 13, 1 }

function _init()
    -- palsorted index
    pal_background = 2
    pal_text = 13
    init_scroller()
    -- debug print
    debug = true
end

function _update()
    update_scroller()
    update_colour()
    update_speed()
end

function _draw()
    cls(palsorted[pal_background])
    draw_scroller(palsorted[pal_text])
    if (debug) draw_debug()
end

-->8
-- ######################## init

function init_scroller()
    -- scroller contents
    scroller = {}
    -- print location
    scroller.x = 4
    scroller.y = 60
    scroller.speed = 3/30
    scroller.width = 30             -- field width in characters 
    scroller.pos = scroller.width   -- print start position
    scroller.text = ""
    scroller.state = "init"
    -- text to show
    text = {}
    text.t = "12345"
    text.t = "lorem ipsum dolor sit amet, consectetur... " -- adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    text.i = 1
    text.iend = 1
end

-->8
-- ###################### update

-- updates scroller pos, text and text i, iend
function update_scroller()
    --if (text.iend < scroller.width and text.iend < #text.t) then
    if (scroller.pos >= 1) then
        -- scrolling in from right side, not fully visible
        scroller.state = "coming in"
        scroller.pos = (scroller.pos - scroller.speed) % (scroller.width + 1)
        text.i = 1
        if (text.iend < #text.t) text.iend += scroller.speed
    elseif (text.i < #text.t + 1) then  -- +1 to allow i to work thru last letter
        -- text on left edge, decreasing
        scroller.state = "going out"
        scroller.pos = 0
        text.i += scroller.speed
        -- BUG: with #text.t>scroller.width the last letter will flash outside of width
        if (text.iend < #text.t) text.iend += scroller.speed
    else
        -- reset to restart from state 1
        scroller.state = "reset"
        scroller.pos = scroller.width
        text.iend = 1
    end
    scroller.text = sub(text.t, flr(text.i), flr(text.iend))
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

function draw_scroller(color)
    print(scroller.text, scroller.x + flr(scroller.pos)*4, scroller.y, color)
end

-- print debug info
function draw_debug()
    print("state:"..scroller.state,0,111,red)
    print("bkg:"..pal_background..",txt:"..pal_text..",pos:"..scroller.pos, 0, 117, pink)
    print("spd:"..scroller.speed..",i:"..text.i..",iend:"..text.iend, 0, 123, pink)
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
