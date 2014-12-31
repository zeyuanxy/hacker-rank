count = [[[[getCount nn mm kk tt | tt <- [0..1]] | kk <- [0..]] | mm <- [0..]] | nn <- [0..]]
    where getCount 1 1 _ _ = 1
          getCount n m k t
            | n == 0 || m == 0 = 0
            | n == 1 || m == 1 = if n == 1 && t == 1 then 1
                                 else if m == 1 && t == 0 then 1
                                 else 0
            | k == 0 = 0
            | t == 0 = (count !! (n - 1) !! m !! k !! t + count !! (n - 1) !! m !! (k - 1) !! (1 - t)) `mod` (10^9 + 7)
            | otherwise = (count !! n !! (m - 1) !! k !! t + count !! n !! (m - 1) !! (k - 1) !! (1 - t)) `mod` (10^9 + 7)
                             
solve :: [[Int]] -> [Int]
solve ([t] : arr) = map (\[n, m, k] -> if n == 1 && m == 1 then 1 else (sum $ count !! n !! m !! k) `mod` (10^9 + 7)) arr

main :: IO ()
main = getContents >>= mapM_ putStrLn . map show . solve . map (map read . words) . lines
