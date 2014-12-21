count = [[getCount nn kk | kk <- [0..]] | nn <- [0..]]
    where getCount n k = if k == 0 || k == n then 1
                         else ((count !! (n - 1) !! (k - 1)) + (count !! (n - 1) !! k)) `mod` 100000007
                  
solve :: [[Int]] -> [Int]
solve ([t] : arr) = map (\[n, k] -> count !! n !! k) arr

main :: IO ()
main = getContents >>= mapM_ putStrLn . map show . solve . map (map read . words) . lines
