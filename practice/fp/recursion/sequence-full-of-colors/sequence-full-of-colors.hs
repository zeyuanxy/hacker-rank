import Control.Monad

solve :: Int -> Int -> Int -> Int -> String -> Bool
solve r g y b [] = if r == g && y == b then True
                   else False
solve r g y b (x:xs)
    | (abs (r - g) <= 1) && (abs (y - b) <= 1) = case x of 'R' -> solve (r + 1) g y b xs
                                                           'G' -> solve r (g + 1) y b xs
                                                           'Y' -> solve r g (y + 1) b xs
                                                           'B' -> solve r g y (b + 1) xs
    | otherwise = False


main :: IO()
main = do
    t <- getLine
    g <- replicateM (read t :: Int) getLine
    putStr $ unlines $ map show $ [solve 0 0 0 0 x | x <- g]
