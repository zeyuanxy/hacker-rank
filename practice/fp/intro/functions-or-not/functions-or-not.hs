-- @Author: Zeyuan Shang
-- @Date:   2017-04-20 17:18:56
-- @Last Modified by:   Zeyuan Shang
-- @Last Modified time: 2017-04-20 17:19:03

import Control.Monad
import qualified Data.Map as Map

iter :: [[Int]] -> Map.Map Int Int -> Bool
iter [] _ = True
iter (xy:xys) m = let (x, y) = (xy !! 0, xy !! 1) in
    case Map.lookup x m of 
        Nothing -> iter xys (Map.insert x y m)
        Just y' -> if y == y' then iter xys m else False

solve :: IO ()
solve = do
    n <- liftM read getLine :: IO Int
    xys <- replicateM n (getLine >>= return . map read . words)
    putStrLn $ if iter xys Map.empty then "YES" else "NO"
   

main :: IO ()
main = do
    t <- getLine
    replicateM_ (read t) solve