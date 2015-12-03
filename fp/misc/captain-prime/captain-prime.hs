-- @Author: Zeyuan Shang
-- @Date:   2015-12-03 17:31:04
-- @Last Modified by:   Zeyuan Shang
-- @Last Modified time: 2015-12-03 17:31:10

import Control.Monad
import qualified Data.List as L

data Result = CENTRAL | LEFT | RIGHT | DEAD deriving (Show)

isPrime :: Int -> Bool
isPrime x = if x <= 1 then False
            else isPrime' x 2
    where isPrime' x divisor = if divisor * divisor > x then True
                               else (x `mod` divisor /= 0) && (isPrime' x (divisor + 1))

solve :: Int -> Result
solve n
    | zero || (not prime) = DEAD
    | left && right = CENTRAL
    | left = LEFT
    | right = RIGHT
    | otherwise = DEAD
    where prime = isPrime n
          zero = '0' `elem` (show n)
          left = all (isPrime . read) (init $ L.tails (show n))
          right = all (isPrime . read) (tail $ L.inits (show n))
          
    
main :: IO ()
main = do
    t <- getLine
    idss <- replicateM (read t) getLine
    let ids = map read idss
    mapM_ print . map solve $ ids