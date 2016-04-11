import Data.Vector as V (Vector, fromList, length, (!), splitAt, tail)

maxValue = 10 ^ 6

data SegmentTree a = Node {
    val :: a,
    lRange :: a,
    rRange :: a,
    leftNode :: SegmentTree a,
    rightNode :: SegmentTree a
} | Empty

getValue :: SegmentTree Int -> Int
getValue Empty = maxValue
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
          val = min (getValue lNode) (getValue rNode)

query :: SegmentTree Int -> Int -> Int -> Int
query Empty _ _ = maxValue
query node l r = if r < ll || rr < l then maxValue
                 else if l <= ll && rr <= r then getValue node
                 else min (query (leftNode node) l r) (query (rightNode node) l r)
    where ll = lRange node
          rr = rRange node
    

solve :: [[Int]] -> [Int] 
solve ([n, m] : arr : arr_q) = map (\[a, b] -> query tree a b) arr_q
    where vec = V.fromList arr
          tree = build vec
                     
main :: IO ()
main = getContents >>= putStr . unlines . map show . solve . map (map read . words) . lines