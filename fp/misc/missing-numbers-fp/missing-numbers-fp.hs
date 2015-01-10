import Control.Monad
import Data.List

solve :: [Int] -> [Int] -> [Int]
solve [] b = b
solve _ [] = []
solve a@(x:xs) b@(y:ys) = if x == y then solve xs ys
                          else if x > y then (y:solve a ys)
                          else solve xs b

main = do
    getLine
    a <- liftM (map read . words) getLine :: IO [Int]
    getLine
    b <- liftM (map read . words) getLine :: IO [Int]
    putStrLn . unwords . map show . map head . group $ solve (sort a) (sort b)