-- @Author: Zeyuan Shang
-- @Date:   2015-12-03 17:17:36
-- @Last Modified by:   Zeyuan Shang
-- @Last Modified time: 2015-12-03 17:17:46

import Data.List
import Control.Monad
import qualified Data.Vector as V

binarySearch :: V.Vector Integer -> Int -> Int -> Integer -> Maybe Int
binarySearch sumArr left right pivot
    | left == right = if midValue >= pivot then Just left else Nothing
    | otherwise = if midValue >= pivot then binarySearch sumArr left mid pivot
                  else binarySearch sumArr (mid + 1) right pivot
    where mid = (left + right) `div` 2
          midValue = sumArr V.! mid

solve :: [Int] -> [Integer] -> [Int]
solve arr query = map (process . binarySearch sumArr 0 (len - 1)) query
    where sumArr = V.fromList $ scanl (+) 0 (map toInteger . reverse . sort $ arr)
          len = V.length sumArr
          process (Just a) = a
          process Nothing = -1


main :: IO ()
main = do
    n <- getLine
    arrs <- getLine
    t <- getLine
    querys <- replicateM (read t) getLine
    let arr = map read $ words arrs
        query = map read querys
    mapM_ print $ solve arr query