reduce :: String -> [Char] -> String
reduce [] _ = []
reduce str occurred = if (head str) `elem` occurred then reduce (tail str) occurred
                      else [head str] ++ reduce (tail str) (occurred ++ [head str]) 

main = do
    str <- getContents
    putStrLn $ reduce str []
