pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- trigonometry
-- by apa

-- consts
left,right,up,down,fire1,fire2=0,1,2,3,4,5
black,dark_blue,dark_purple,dark_green,brown,dark_gray,light_gray,white,red,orange,yellow,green,blue,indigo,pink,peach=0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15

function _init()
    -- sin curve location
    sincurve = {}
    sincurve.x0 = 9
    sincurve.x1 = 55
    sincurve.y0 = 40
    sincurve.yh = 15
    -- cos curve location
    coscurve = {}
    coscurve.x0 = sincurve.x0
    coscurve.x1 = sincurve.x1
    coscurve.y0 = 90
    coscurve.yh = 15
end

function _update()
    
end

function _draw()
    cls(black)
    draw_sincurve(sincurve.x0, sincurve.x1, sincurve.y0, sincurve.yh)
    draw_coscurve(coscurve.x0, coscurve.x1, coscurve.y0, coscurve.yh)
end

-->8
-- ################# sin and cos

-- draws sin curve to given coords and size
function draw_sincurve(x0, x1, y0, yh)
    draw_curvescale("sin(i)", x0, x1, y0, yh)
    for x = x0, x1 do
        -- consider x0=0 and x1=1 and get value for each point in between
        val = sin((x - x0) / (x1 - x0))
        draw_curve(val, x, y0, yh)
    end
end

-- draws cos curve to given coords and size
function draw_coscurve(x0, x1, y0, yh)
    draw_curvescale("cos(i)", x0, x1, y0, yh)
    for x = x0, x1 do
        -- consider x0=0 and x1=1 and get value for each point in between
        val = cos((x - x0) / (x1 - x0))
        draw_curve(val, x, y0, yh)
    end
end

-- draws scale lines and values
function draw_curvescale(name, x0, x1, y0, yh)
    print(name, x0 + 12, y0 - yh - 7, white)
    print("1", x0 - 5, y0 - yh - 2, light_gray)
    print("0", x0 - 5, y0 - 2, light_gray)
    print("-1", x0 - 9, y0 + yh - 2, light_gray)
    -- Horizontal zero level line
    line(x0, y0, x1, y0, dark_gray)
    -- Vertical range line
    line(x0, y0 - yh, x0, y0 + yh, dark_gray)
end

-- plots -1..1 value with y mapped to y height starting from y0
function draw_curve(val, x, y0, yh)
    -- map value to y coords
    y = y0 + (val * yh)
    pset(x, y, dark_green)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
