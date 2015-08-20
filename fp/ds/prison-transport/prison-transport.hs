import Control.Applicative (liftA)
import Control.Monad (forM, forM_)
import qualified Data.Sequence as S(Seq, foldrWithIndex, fromList, index, update, (><))

main = do
    n <- liftA (\x -> read x :: Int) getLine
    m <- liftA (\x -> read x :: Int) getLine
    edges <- forM [1..m] $ \_ -> do
        [x, y] <- liftA (map (\x -> read x :: Int) . words) getLine
        return (x, y)
    print edges