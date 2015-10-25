import Data.List
import qualified Data.Sequence as S (fromList, index, zipWith3, foldlWithIndex)

solve :: [[Int]] -> Int
solve ([n] : height : _) = S.foldlWithIndex getMax 0 $ S.zipWith3 calc l r height'
    where height' = S.fromList height
          l = S.fromList [calc_l i i | i <- [0..n-1]]
          calc_l i ll
            | ll > 0 && (S.index height' (ll - 1)) >= (S.index height' i) = calc_l i (S.index l (ll - 1))
            | otherwise = ll
          r = S.fromList $ reverse [calc_r i i | i <- [n-1,n-2..0]]
          calc_r i rr
            | rr < (n - 1) && (S.index height' (rr + 1)) >= (S.index height' i) = calc_r i (S.index r (rr + 1))
            | otherwise = rr
          calc a b c = (b - a + 1) * c
          getMax ans index area = max ans area
         

main :: IO ()
main = getContents >>= print . solve . map (map read . words) . lines