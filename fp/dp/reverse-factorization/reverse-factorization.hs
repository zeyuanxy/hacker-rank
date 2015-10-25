import Data.List

search :: Int -> [Int] -> Maybe [Int]
search 1 _ = Just [1]
search n [] = Nothing
search n arr = if (n `mod` lastOne == 0) then
                case search (n `div` lastOne) arr of
                    Nothing -> Nothing
                    Just xs -> Just (n:xs)
               else search n (init arr)
                where lastOne = last arr

solve :: [[Int]] -> [Int]
solve ([n, k] : arr) = case (search n . sort $ head arr) of 
                        Nothing -> [-1]
                        Just ans -> reverse ans

main :: IO ()
main = getContents >>= putStrLn . intercalate " " . map show . solve . map (map read . words) . lines
