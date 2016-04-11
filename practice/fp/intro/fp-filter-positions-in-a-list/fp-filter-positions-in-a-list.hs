f lst = [lst !! i | i <- [0..(length lst) - 1], odd i]

main = do
   inputdata <- getContents
   mapM_ putStrLn $ map show $ f $ map (read :: String -> Int) $ lines inputdata
