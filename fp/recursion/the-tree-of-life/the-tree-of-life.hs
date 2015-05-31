{-# LANGUAGE DeriveFunctor #-}
import Data.Word
import Data.Bits

import Control.Applicative
import Control.Monad
import Control.Monad.State

import Text.Parsec hiding ((<|>))
import Text.Parsec.String (Parser)
import Text.Printf

data Tree a
    = Leaf a
    | Branch (Tree a) a (Tree a)
      deriving (Functor, Show)
      
getRoot :: Tree a -> a
getRoot (Left a) = a
getRoot (Branch _ a _) = a

      
type Rule a = a -> a -> a -> a -> a

makeRule :: Word16 -> Rule Bool
makeRule ruleEncoding v1 v2 v3 v4 = testBit ruleEncoding pos
    where pos = sum (ZipWith (*) (map fromEnum [v4, v3, v2, v1]) (iterate (*2 ) 1))

nextTree :: Rule Bool -> Tree Bool -> Tree Bool
nextTree rule = withParent False
    where withParent p t = case t of
        Leaf a -> Leaf (rule p False v False)
        Branch l a r -> Branch (withParent a l)
                               (rule p (getRoot l) a (getRoot r))
                               (withParent a r) 

parseTree :: Parser (Tree Bool)
parseTree = parseBranch <|> parseLeaf
    where parseCell = (char 'X' >> return True) <|> (char '.' >> return False)
          parseLeaf = Leaf <$> parseCell
          parseBranch = between (char '(') (char ')')
                                (Branch <$> parseTree <*> (space *> parseCell *< space) <*> parseTree)
                                
buildTrees :: Word16 -> Tree Bool -> [Tree Bool]
buildTrees i = iterate (nextTree (makeRule i))


type Dir = Char

parseQuery :: String -> (Int, [Dir])
parseQuery s = (read si, path)
    where (si:sp:_) = words s
          path = init . tail $ sp

cellToStr :: Bool -> String
cellToStr v = if v then "X" else "."

printTree :: Tree Bool -> [Dir] -> IO ()
printTree t [] = putStrLn . cellToStr . getRoot $ t
printTree (Branch l _ _) ('<':ps) = executeQuery l ps
printTree (Branch _ _ r) ('>':ps) = executeQuery r ps
printTree _ _ = error "no such path in the tree"

forward :: ([a], [a]) -> ([a], [a])
forward (x:xs, ys) = (x, x:ys)
forward _ = error "no such tree"

backward :: ([a], [a]) -> ([a], [a])
backward (xs, y:ys) = (y:xs, ys)
backward _ = error "no such tree"

here :: ([a], [a]) -> a
here = head . fst

fTimes :: (a -> a) -> Int -> a -> a
fTimes _ 0 = id
fTimes f n = f . fTimes f (n - 1)

main :: IO ()
main = do
    trees <- buildTrees
                <$> readLn
                <*> ((parse (parseTree <* (spaces >> eof))) <$> getLine)
    n <- readLn
    evalStateT (replicateM_ n (do
                                (i, ps) <- lift (parseQuery <$> getLine)
                                modify (if i >= 0 then fTimes forward i
                                        else fTimes backward (-i))
                                t <- gets here
                                lift $ printTree t ps
                                ))
               (trees, [])