import Data.List (sortBy)

-- Valid digits for hh (in 24h)
hh = [ (x, y) | x <- [0..2], y <- [0..9], f x y ]
  where f x y = x /= 2 || y < 4

-- Valid digits for mm
mm = [ (x, y) | x <- [0..5], y <- [0..9] ]

-- Subset of hh with palindrom in mm
hh' = [ (x, y, f x y) | (x, y) <- hh, elem (y, x) mm ]
  where
    -- Add absolute minute during day
    f x y = (x*10+y)*60+(y*10)+x

-- Pairs of sibling palindroms with minute difference
siblings = map f (zip hh' (tail hh' ++ [head hh']))
  where
    f ((x, y, a), (x', y', a')) = (((x, y), (x', y')), d)
      where
        d = (if a' > a then a' else (a'+24*60))-a

-- Siblings sorted by minute difference
siblings' = sortBy f siblings
  where
    f x y = compare (snd x) (snd y)

-- Sibling with maximum minute difference
maxSibling = last siblings'
