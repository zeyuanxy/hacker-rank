import Text.Printf
import qualified Data.List as L

cross :: (Int, Int) -> (Int, Int) -> (Int, Int) -> Int
cross (x1, y1) (x2, y2) (x3, y3) = (x2 - x1) * (y3 - y1) - (y2 - y1) * (x3 - x1)

lower_hull :: [(Int, Int)] -> [(Int, Int)] -> [(Int, Int)]
lower_hull points [] = points
lower_hull points rest@(x:xs) 
    | length points >= 2 && cross (points !! 1) (points !! 0) x <= 0 = lower_hull (drop 1 points) rest
    | otherwise = lower_hull ([x] ++ points) xs
    
upper_hull :: [(Int, Int)] -> [(Int, Int)] -> [(Int, Int)]
upper_hull points rest = lower_hull points (reverse rest)
    
dist :: (Int, Int) -> (Int, Int) -> Double
dist (x1, y1) (x2, y2) = sqrt . fromIntegral $ (x1 - x2) ^ 2 + (y1 - y2) ^ 2

solve :: [(Int, Int)] -> Double
solve points = if length points < 2 then 0
               else dist p1 p2 + solve (drop 1 points)
                where p1 = points !! 0
                      p2 = points !! 1  

main :: IO ()
main = do
  n <- readLn :: IO Int
  content <- getContents
  let  
    points = L.sort $ map (\[x, y] -> (x, y)). map (map (read::String->Int)). map words. lines $ content
    hull = (lower_hull [] points) ++ (upper_hull [] points)
    ans = solve hull
  printf "%.1f\n" ans
