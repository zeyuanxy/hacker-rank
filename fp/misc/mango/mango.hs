import Data.List

solve :: [[Int]] -> Int
solve ([n, m] : a : h : _) = calc 0 n
                        where calc l r = if l > r then r
                                         else if iter > m then calc l (mid - 1)
                                         else calc (mid + 1) r
                                            where mid = (l + r) `div` 2
                                                  iter = sum . take mid . sort $ zipWith (\x y -> x + (mid - 1) * y) a h
        
main :: IO ()
main = getContents >>= putStrLn . show . solve . map (map read . words) . lines
