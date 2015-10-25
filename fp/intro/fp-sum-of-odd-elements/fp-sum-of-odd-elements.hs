f arr = sum([x | x <- arr, odd x])

main = do
   inputdata <- getContents
   putStrLn $ show $ f $ map (read :: String -> Int) $ lines inputdata
