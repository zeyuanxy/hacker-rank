import Control.Monad

memorized_func :: Int -> Integer
memorized_func = (map func [0..] !!)
                where 
                    func 0 = 1
                    func i = (sum [memorized_func x * memorized_func(i - x - 1) | x <-[0..i - 1]]) `mod` 100000007

main = do
    n <- getLine
    num <- replicateM (read n) getLine
    putStr $ unlines $ map show $ [memorized_func (read x :: Int) | x <- num]
