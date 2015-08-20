import Control.Applicative (liftA)
import Control.Monad (forM, forM_)
import qualified Data.Sequence as S(Seq, foldrWithIndex, fromList, index, update, (><))

data UnionFind a = UF {
    ids :: S.Seq a,
    sizes :: S.Seq a
} deriving (Show)

findRoot :: UnionFind Int -> Int -> Int
findRoot uf x 
    | x == x' = x
    | otherwise = findRoot uf x'
    where x' = S.index (ids uf) (x - 1)

joinRoot :: UnionFind Int -> Int -> Int -> UnionFind Int
joinRoot uf x y = UF {
        ids = S.update (y - 1) (S.index (ids uf) (x - 1)) (ids uf),
        sizes = S.update (x - 1) (S.index (sizes uf) (y - 1) + 
                S.index (sizes uf) (x - 1)) (sizes uf)
    }

mergeElem :: UnionFind Int -> Int -> Int -> UnionFind Int
mergeElem uf x y
    | x' == y' = uf
    | x' < y' = joinRoot uf x' y'
    | otherwise = joinRoot uf y' x'
    where
        x' = findRoot uf x
        y' = findRoot uf y

process :: UnionFind Int -> [(Int, Int)] -> UnionFind Int
process uf [] = uf
process uf ((x, y):es) = process (mergeElem uf x y) es

solve :: UnionFind Int -> Int
solve = sum' . getSizes
    where 
        getSizes uf = S.foldrWithIndex (\i v acc ->
                if i + 1 == v then S.index (sizes uf) i:acc
                else acc) [] (ids uf)
        sum' = foldr (\x z -> z + ceiling (sqrt (fromIntegral x))) 0

main :: IO ()
main = do
    n <- liftA (\x -> read x :: Int) getLine
    m <- liftA (\x -> read x :: Int) getLine
    edge <- forM [1..m] $ \_ -> do
        [x, y] <- liftA (map (\x -> read x :: Int) . words) getLine
        return (x, y)
    let 
        uf = UF {
            ids = S.fromList [1..n],
            sizes = S.fromList $ replicate n 1
        }
        uf' = process uf edge
    print $ solve uf'