import Control.Monad

memorized_func :: Int -> Int
memorized_func 1 = 1
memorized_func i = 3 * i * (i + 1) `div` 2 - 2 * i
       
main = do
    n <- getLine
    num <- replicateM (read n) getLine
    putStr $ unlines $ map show $ [memorized_func (read x :: Int) | x <- num]
