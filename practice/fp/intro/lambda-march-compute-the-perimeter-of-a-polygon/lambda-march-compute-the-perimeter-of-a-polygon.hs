-- @Author: Zeyuan Shang
-- @Date:   2017-04-20 17:18:56
-- @Last Modified by:   Zeyuan Shang
-- @Last Modified time: 2017-04-21 13:07:41

import Control.Monad

iter :: [([Double], [Double])] -> Double
iter [] = 0
iter ((xy1, xy2):xys) = (sqrt ((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) + iter xys
    where (x1, y1) = (xy1 !! 0, xy1 !! 1)
          (x2, y2) = (xy2 !! 0, xy2 !! 1)
                  
main :: IO ()
main = do
    n <- liftM read getLine :: IO Int
    xy <- replicateM n (getLine >>= return . map read . words)
    print . iter $ zip xy (tail xy ++ [head xy])