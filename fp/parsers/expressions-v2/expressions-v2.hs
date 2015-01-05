import Data.Char

tokenize :: String -> [String]
tokenize s = iter (filter (not . isSpace) s) []
    where iter rest ans
            | null rest = reverse ans
            | isDigit $ head rest = let
                p = break (not . isDigit) rest
                in iter (snd p) (fst p : ans)
            | otherwise = iter (tail rest) ([head rest]: ans)

data Node = NumberNode Integer
          | NegateNode Node
          | OpNode Char Node Node
          deriving (Show)

parse :: [String] -> Node
parse tokens = fst $ iter_expression tokens
    where iter_expression rest = let
            (n1, r1) = iter_term rest
            in if null r1 || (head r1 /= "+" && head r1 /= "-") 
               then (n1, r1)
               else let 
                    (n2, r2) = iter_expression $ tail r1
                    in (OpNode (head $ head r1) n1 n2, r2)
          iter_term rest = let
            (n1, r1) = iter_factor rest
            in if null r1 || (head r1 /= "*" && head r1 /= "/")
               then (n1, r1)
               else let
                    (n2, r2) = iter_term $ tail r1
                    in (OpNode (head $ head r1) n1 n2, r2)
          iter_factor rest = case head rest of
            "+" -> iter_factor $ tail rest
            "-" -> let (n, r) = iter_factor $ tail rest in (NegateNode n, r)
            "(" -> let (n, r) = iter_expression $ tail rest in (n, tail r)
            otherwise -> (NumberNode (read $ head rest :: Integer), tail rest)
            
m = 1000000007

evaluate :: Node -> Integer
evaluate (NumberNode val) = val
evaluate (NegateNode node) = (m - evaluate node) `mod` m
evaluate (OpNode op n1 n2) = case op of
    '+' -> (v1 + v2) `mod` m
    '-' -> (m + v1 - v2) `mod` m
    '*' -> (v1 * v2) `mod` m
    '/' -> (v1 * iter 1 v2 (m - 2)) `mod` m
    where v1 = evaluate n1
          v2 = evaluate n2
          iter r x y
            | y == 0 = r
            | y `mod` 2 == 0 = iter r ((x * x) `mod` m) (y `div` 2)
            | otherwise = iter ((r * x) `mod` m) ((x * x) `mod` m) (y `div` 2)

main :: IO ()
main = do
    expression <- getLine
    putStrLn . show . evaluate . parse . tokenize $ expression
            
