-- @Author: Zeyuan Shang
-- @Date:   2015-12-05 15:50:26
-- @Last Modified by:   Zeyuan Shang
-- @Last Modified time: 2015-12-05 17:15:12

import Control.Monad
import qualified Data.Vector as V
import qualified Data.Map as M

p :: Int
p = 10^(9::Int) + 7

primeFactors :: M.Map Int (M.Map Int Int)
primeFactors = M.fromList . zip [1..] . map (M.fromList . factorize 2) $ [1..100]
    where factor x n = if n `mod` x == 0 then 1 + factor x (n `div` x) else 0
          factorize x n
            | x * x > n = if n == 1 then [] else [(n, 1)]
            | n `mod` x == 0 = (x, factor x n):factorize (succ x) (until (\n -> n `mod` x /= 0) (`div` x) n)
            | otherwise = factorize (succ x) n
            
            
fastPower :: Int -> Int -> Int
fastPower _ 0 = 1
fastPower a b = if even b then ret else (ret * a) `mod` p
    where tmp = fastPower a (b `div` 2)
          ret = (tmp * tmp) `mod` p
          
factorsToValue :: [(Int, Int)] -> Int
factorsToValue [] = 1
factorsToValue ((a, b):xs) = ((fastPower a b) * factorsToValue xs) `mod` p

data SegmentTree a = Node {
    val :: a,
    lRange :: Int,
    rRange :: Int,
    leftNode :: SegmentTree a,
    rightNode :: SegmentTree a
} | Empty

getValue :: SegmentTree (M.Map Int Int) -> M.Map Int Int
getValue Empty = M.empty
getValue node = val node

build :: V.Vector Int -> SegmentTree (M.Map Int Int)
build vec = rangeBuild vec 0 (V.length vec - 1)

rangeBuild :: V.Vector Int -> Int -> Int -> SegmentTree (M.Map Int Int)
rangeBuild vec l r = if l > r then Empty
                     else if l == r then Node (primeFactors M.! (vec V.! l)) l r Empty Empty
                     else Node val l r lNode rNode
    where mid = (l + r) `div` 2
          lNode = rangeBuild vec l mid
          rNode = rangeBuild vec (mid + 1) r
          val = M.unionWith max (getValue lNode) (getValue rNode)

query :: SegmentTree (M.Map Int Int) -> Int -> Int -> M.Map Int Int
query Empty _ _ = getValue Empty
query node l r = if r < ll || rr < l then getValue Empty
                 else if l <= ll && rr <= r then getValue node
                 else M.unionWith max (query (leftNode node) l r) (query (rightNode node) l r)
    where ll = lRange node
          rr = rRange node
    
update :: SegmentTree (M.Map Int Int) -> Int -> Int -> SegmentTree (M.Map Int Int)
update Empty _ _ = Empty
update node idx value
    | idx < ll || idx > rr = node
    | ll == rr = node {val = M.unionWith (+) (primeFactors M.! value) (getValue node)}
    | otherwise = node {val = newVal, leftNode = left, rightNode = right}
    where ll = lRange node
          rr = rRange node
          left = update (leftNode node) idx value
          right = update (rightNode node) idx value
          newVal = M.unionWith max (getValue left) (getValue right)
          
solve :: SegmentTree (M.Map Int Int) -> [[String]] -> [Int]
solve tree [] = []
solve tree (("Q":l:r:_):qs) = [factorsToValue . M.toList $ query tree (read l) (read r)] ++ solve tree qs
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