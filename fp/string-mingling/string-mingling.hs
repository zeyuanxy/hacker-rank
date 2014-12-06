mingle :: String -> String -> String
mingle [] [] = []
mingle (p:ps) (q:qs) = p:q:mingle ps qs


main = do
    a <- getLine
    b <- getLine
    putStrLn $ mingle a b
