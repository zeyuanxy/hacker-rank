blank :: Int -> Int -> [String]
blank x y = replicate x $ replicate y '_'

tri :: Int -> [String]
tri 1 = ["1"]
tri n = tri' 1
    where tri' x | x > n = []
                 | otherwise = l' : tri' (x + 1)
                    where l' = replicate (n-x) '_' ++
                               replicate (2*x-1) '1' ++
                               replicate (n-x) '_'

anneal = foldl1 (zipWith (++))

extend x = anneal [blank p p, x, blank p p] ++
           anneal [x, blank p 1, x]
  where p = length x

solve :: Int -> Int -> [String]
solve x 0 = tri x
solve x n = extend $ solve (x `div` 2) (n - 1)


main :: IO()
main = do
    g <- getContents
    putStr $ unlines $ solve 32 (read g :: Int)
