pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- factorial of a number, a recursive function
-- by apa64 from programming in lua

-- computes the factorial of n
-- returns factorial (kertoma)
function fact(n)
  if (n == 0) then
    return 1
  else
    return (n * fact(n-1))
  end
end

-- numbers are -32768..32767
-- 2 bytes, -0x8000..0x7fff
-- thats why it wraps at 8
for i=1,10 do
  print(i.."! = "..fact(i))
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000