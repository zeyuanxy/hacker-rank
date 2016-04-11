calc :: Int -> Int -> Int
calc m i = if i * i > m then 0
           else p + calc m (i + 1)
            where p = if m `mod` i == 0 then
                        if i * i /= m then 2 else 1
                      else 0

solve :: [[Int]] -> [Int]
solve ([t] : arr) = map (\[m, n] -> calc (gcd m n) 1) arr

main :: IO ()
main = getContents >>= mapM_ putStrLn . map show . solve . map (map read . words) . lines