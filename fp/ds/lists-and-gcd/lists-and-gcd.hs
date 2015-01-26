mport Text.Printf

getFactors :: [Int] -> [(Int, Int)]
getFactors [] = []
getFactors (x:y:xs) = (x, y): getFactors xs

merge :: [(Int, Int)] -> [(Int, Int)] -> [(Int, Int)]
merge [] _ = []
merge _ [] = []
merge xa@((x, xx):xs) ya@((y, yy):ys)
    | x < y = merge xs ya
    | x > y = merge xa ys
    | otherwise = (x, min xx yy):merge xs ys

solve :: [[Int]] -> [(Int, Int)]
solve ([q] : rest) = foldl1 merge facts
                    where facts = map getFactors rest
        
main :: IO ()
main = getContents >>= mapM_ (uncurry (printf "%d %d ")) . solve . map (map read . words) . lines
