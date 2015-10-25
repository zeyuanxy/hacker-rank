blank :: Int -> Int -> [String]
blank x y = replicate x $ replicate y '_'

vertical :: Int -> [String]
vertical n = replicate n (replicate n '_' ++ ['1'] ++ replicate n '_')

left_slant :: Int -> [String]
left_slant n = [replicate i '_' ++ ['1'] ++ replicate (n - i - 1) '_' | i <- [0..n - 1]]

right_slant :: Int -> [String]
right_slant n = [replicate (n - i - 1) '_' ++ ['1'] ++ replicate i '_' | i <- [0..n - 1]]

tree :: Int -> [String]
tree n = foldl1 (zipWith (++)) [left_slant n, blank n 1, right_slant n] ++
         vertical n

big_tree :: Int -> Int -> [String]
big_tree n m 
    | m == 1 = tree n
    | otherwise = (foldl1 (zipWith (++)) [half, blank l (2 * n - r), half]) ++ 
                  (foldl1 (zipWith (++)) [blank (2 * n) (r `div` 2), tree n, blank (2 * n) (r `div` 2)]) 
        where half = big_tree (n `div` 2) (m - 1)
              l = length half
              r = length (half !! 0)

solve :: Int -> Int -> Int -> [String]
solve n m x = blank (n - l) m ++
              (map func t)
    where t = big_tree 16 x
          l = length t
          func line = replicate ((m - w) `div` 2) '_' ++
                      line ++
                      replicate (m - w - ((m - w) `div` 2)) '_'
            where w = length line

main :: IO()
main = do
    g <- getContents
    putStr $ unlines $ solve 63 100 (read g :: Int)
