-- @Author: Zeyuan Shang
-- @Date:   2015-12-05 15:50:26
-- @Last Modified by:   Zeyuan Shang
-- @Last Modified time: 2015-12-05 15:50:34

import Data.Vector as V (Vector, fromList, length, (!), splitAt, tail)
import Control.Monad

data SegmentTree a = Node {
    val :: a,
    lRange :: a,
    rRange :: a,
    leftNode :: SegmentTree a,
    rightNode :: SegmentTree a
} | Empty

getValue :: SegmentTree Int -> Int
getValue Empty = 1
getValue node = val node

build :: V.Vector Int -> SegmentTree Int
build vec = rangeBuild vec 0 (V.length vec - 1)

rangeBuild :: V.Vector Int -> Int -> Int -> SegmentTree Int
rangeBuild vec l r = if l > r then Empty
                     else if l == r then Node (vec V.! l) l r Empty Empty
                     else Node val l r lNode rNode
    where mid = (l + r) `div` 2
          lNode = rangeBuild vec l mid
          rNode = rangeBuild vec (mid + 1) r
          val = lcm (getValue lNode) (getValue rNode)

query :: SegmentTree Int -> Int -> Int -> Int
query Empty _ _ = 1
query node l r = if r < ll || rr < l then getValue Empty
                 else if l <= ll && rr <= r then getValue node
                 else lcm (query (leftNode node) l r) (query (rightNode node) l r)
    where ll = lRange node
          rr = rRange node
    
update :: SegmentTree Int -> Int -> Int -> SegmentTree Int
update Empty _ _ = Empty
update node idx value
    | ll > idx || rr < idx = node
    | ll == rr = node {val = (getValue node) * value}
    | otherwise = node {leftNode = left, rightNode = right}
    where ll = lRange node
          rr = rRange node
          left = update (leftNode node) idx value
          right = update (rightNode node) idx value

solve :: SegmentTree Int -> [[String]] -> [Int]
solve tree [] = []
solve tree (("Q":l:r:_):qs) = [query tree (read l) (read r)] ++ solve tree qs
solve tree (("U":idx:val:_):qs) = solve new_tree qs
    where new_tree = update tree (read idx) (read val)
                     
main :: IO ()
main = do 
    n <- getLine
    arr <- getLine >>= return . map read . words
    m <- getLine
    querys <- replicateM (read m) getLine
    let query = map words querys
        vec = V.fromList arr
        tree = build vec
    mapM_ print $ solve tree query