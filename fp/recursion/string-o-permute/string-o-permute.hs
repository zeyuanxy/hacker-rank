import Control.Monad

solve :: String -> String
solve [] = []
solve (x:y:ys) = [y, x] ++ solve ys 

main = do
    n <- getLine
    str <- replicateM (read n) getLine
    putStr $ unlines $ map solve str
