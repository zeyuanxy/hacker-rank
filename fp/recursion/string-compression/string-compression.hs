solve :: Char -> Int -> String -> String
solve _ 0 (x:xs) = solve x 1 xs
solve c n [] = [c] ++ (\n -> if n == 1 then [] else show n) n
solve c n (x:xs) = if x == c then solve c (n + 1) xs
                    else [c] ++ (\n -> if n == 1 then [] else show n) n ++ solve x 1 xs

main :: IO()
main = do
    s <- getLine
    putStr $ solve '0' 0 s
