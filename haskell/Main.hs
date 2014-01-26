-- Valid digits for hh (in 24h)
hour = [ (x, y) | x <- [0..2], y <- [0..9], f x y ]
  where f x y = x /= 2 || y < 4

-- Valid digits for mm
minute = [ (x, y) | x <- [0..5], y <- [0..9] ]

-- Minute is the palindrom of the hour
palindrom = [ (x, y, m) |
  (x, y) <- hour,
  elem (y, x) minute,
  let m = (x*10+y)*60+(y*10)+x ]

-- Find sibling palindroms with max distance
max1 = max2 palindrom

-- Initialize search with first 2 palindroms 
max2 ((x1, y1, m1):l'@((x2, y2, m2):l)) =
  max3 (m2-m1, False, x1, y1, x2, y2) l'

-- Keep on searching through the list
max3 z [_] = z
max3 (d1, tf, x1, y1, x2, y2) ((x3, y3, m3):l'@((x4, y4, m4):l)) =
  let d2 = m4 - m3 in
    if (d2 > d1) then max3 (d2, False, x3, y3, x4, y4) l'
    else if (d2 == d1) then max3 (d2, True, x3, y3, x4, y4) l'
    else max3 (d1, tf, x1, y1, x2, y2) l'