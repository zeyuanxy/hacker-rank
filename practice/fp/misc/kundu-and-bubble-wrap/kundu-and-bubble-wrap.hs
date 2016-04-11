import Control.Monad

solve :: Int -> Double
solve n = sum [(fromIntegral n) / (fromIntegral (n - i)) | i <- [0..n - 1]]

main = do
    l <- liftM (map read . words) getLine :: IO [Int]
    let 
        n = l !! 0
        m = l !! 1
    putStrLn . show $ solve (n * m)