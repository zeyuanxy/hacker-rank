-- @Author: Zeyuan Shang
-- @Date:   2015-12-01 00:42:05
-- @Last Modified by:   Zeyuan Shang
-- @Last Modified time: 2015-12-01 00:42:16

solve :: [[Int]] -> [Int]
solve ([n] : arr : _) = reverse arr

main :: IO ()
main = getContents >>= putStr . unwords . map show . solve . map (map read . words) . lines