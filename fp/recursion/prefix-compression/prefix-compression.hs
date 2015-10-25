findPrefix :: String -> String -> String
findPrefix [] _ = []
findPrefix _ [] = []
findPrefix (x:xs) (y:ys) = if x == y then x : findPrefix xs ys
                           else []

solve :: String -> String -> [String]
solve x y = [prefix, (drop l x), (drop l y)]
            where prefix = findPrefix x y
                  l = length prefix

withLength :: String -> String
withLength x = (show $ length x) ++ " " ++ x

main :: IO()
main = do
    x <- getLine
    y <- getLine
    putStr $ unlines $ map withLength $ solve x y
