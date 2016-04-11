import Control.Monad

rotate :: String -> [String]
rotate s = [[s !! (i `mod` len)] ++ (drop (i `mod` len + 1) s) ++ (take (i `mod` len) s) | i <- [1..len]]
            where len = length s
            
main = do
    n <- getLine
    str <- replicateM (read n) getLine
    putStr $ unlines $ map unwords $ map rotate str
