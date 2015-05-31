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
      
type Rule a = a -> a -> a -> a -> a

type Dir = Char

makeRule :: Word16 -> Rule Bool
makeRule ruleEncoding v1 v2 v3 v4 = testBit ruleEncoding pos
    where pos = sum (ZipWith (*) (map fromEnum [v4, v3, v2, v1]) (iterate (*2 ) 1))
    
getValue :: Tree a -> a
getValue (Left v) = v
getValue (Branch _ v _) = v

nextTree :: Rule Bool -> Tree Bool -> Tree Bool
nextTree rule = withParent False
    where withParent p t = case t of
        Leaf a -> Leaf (rule p False v False)
        Branch l a r -> Branch (withParent a l)
                               (rule p (getValue l) a (getValue r))
                               (withParent a r)
                               
parseTree :: Parser (Tree Bool)
parseTree = parseBranch <|> parseLeaf
    where parseCell = (char 'X' >> return True) <|> (char '.' >> return False)
          parseLeaf = Leaf <$> parseCell
          parseBranch = between (char '(') (char ')')
                                (Branch <$> parseTree <*> (space *> parseCell *< space) <*> parseTree)