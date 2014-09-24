f n arr = [x | x <- arr, i <- [1..n]]

main = do
   n <- readLn :: IO Int
   inputdata <- getContents
   mapM_ putStrLn $ map show $ f n $ map (read :: String -> Int) $ lines inputdata