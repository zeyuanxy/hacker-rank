import qualified Data.List as L
import qualified Data.Map.Strict as M

solve :: String -> String -> String
solve x y = if length before_last == 0 then "-1"
            else foldr (\a b -> a ++ " " ++ b) "" before_last
    where wx = map (\s -> read s :: Int) (L.words x)
          n = wx !! 0
          k = wx !! 1
          wy = L.words y
          m = foldr (\ele mm -> M.insertWith (+) ele 1 mm) M.empty wy
          before_last = L.nub $ filter filter_func wy
            where filter_func ele = case M.lookup ele m of
                                        Nothing -> False
                                        Just v -> if v >= k then True else False                            

main :: IO()
main = do
    st <- getLine
    sq <- getContents
    let 
       t = read st :: Int 
       q = lines sq
    putStr . unlines $ [solve (q !! (2 * i)) (q !! (2 * i + 1)) | i <- [0..t - 1]]
