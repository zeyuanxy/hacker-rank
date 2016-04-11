f :: Int -> [Int] -> [Int]
f n arr = [x | x <- arr, x < n]

main = do 
    n <- readLn :: IO Int 
    inputdata <- getContents 
    let 
        numbers = map read (lines inputdata) :: [Int] 
    putStrLn . unlines $ (map show . f n) numbers
