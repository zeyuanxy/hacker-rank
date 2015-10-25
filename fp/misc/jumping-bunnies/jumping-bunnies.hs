solve :: [Int] -> Int
solve [] = 1
solve (x:xs) = x * s `div` (gcd x s)
            where s = solve xs

main = do
    n <- getLine
    s <- getLine
    print $ (solve . map read . words) s
