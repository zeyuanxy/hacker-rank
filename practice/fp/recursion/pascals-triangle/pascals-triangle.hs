next xs = zipWith (+) ([0] ++ xs) (xs ++ [0])
pascal = iterate next [1]
solve n = putStr $ unlines $ map unwords $ map (map show) $ take n pascal

main = do
    n <- readLn :: IO Int
    solve n
