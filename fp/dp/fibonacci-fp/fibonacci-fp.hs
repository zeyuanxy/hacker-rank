import Control.Monad

memorized_func :: Int -> Integer
memorized_func = (map func [0..] !!)
                where 
                    func 0 = 0
                    func 1 = 1
                    func n = (memorized_func (n - 1) + memorized_func (n - 2)) `mod` 100000007

main = do
    n <- getLine
    num <- replicateM (read n) getLine
    putStr $ unlines $ map show $ [memorized_func (read x :: Int) | x <- num]
