-- @Author: Zeyuan Shang
-- @Date:   2015-11-18 21:13:38
-- @Last Modified by:   Zeyuan Shang
-- @Last Modified time: 2015-11-18 21:13:45

import Control.Monad

data Automaton a = Node {value :: a,
                         success :: Automaton a,
                         failure :: Automaton a,
                         accept :: Bool
                         } |
                   Null {success :: Automaton a,
                         accept :: Bool}            
            
isNull (Null _ _) = True
isNull _ = False

buildAutomaton :: Eq a => [a] -> Automaton a
buildAutomaton (x:xs) = automaton
    where automaton = Node x (build xs automaton) (Null automaton False) (null xs)
          build [] s = s
          build (x:xs) s
            | x == value s = success s `nextNode` failure s
            | otherwise    = newS `nextNode` s
            where nextNode a b = Node x (build xs a) b (null xs)
                  newS = success $ until (\s -> isNull s || x == value s) failure s

matchFold :: Eq a => Automaton a -> [a] -> ([a] -> b -> b) -> ([a] -> b -> b) -> b -> b
matchFold _ [] _ _ identity = identity
matchFold state text nomat mat identity = match' state text
    where match' _ [] = identity
          match' a (x:xs)
            | not (isNull a) && value a /= x = stay
            | not (accept a)                 = nomat (x:xs) next
            | otherwise                      = mat (x:xs) next
            where next = match' (success a) xs
                  stay = match' (failure a) (x:xs)
                
isInfixOf' :: Eq a => [a] -> [a] -> Bool
isInfixOf' pattern text
    | null pattern = True
    | otherwise = or $ matchFold (buildAutomaton pattern) text (const (False:)) (const (True:)) []  
    
main = do
    n <- getLine 
    replicateM_ (read n) $ do
        a <- getLine
        b <- getLine
        if isInfixOf' b a == True then putStrLn "YES"
        else putStrLn "NO"