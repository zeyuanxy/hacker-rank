import Data.List

isPossible :: [String] -> String -> (Int, Int) -> (Int, Int) -> Bool
isPossible _ [] _ _ = True
isPossible grid (w:ws) (x, y) (dx, dy)
    | x < 10 && y < 10 && (grid !! x !! y == w || grid !! x !! y == '-') = isPossible grid ws (x + dx, y + dy) (dx, dy)
    | otherwise = False

putWords :: [String] -> String -> (Int, Int) -> (Int, Int) -> [String]
putWords grid word (x, y) (dx, dy) = [[charAt r c | c <- [0..9]] | r <- [0..9]]
    where len = length word
          idx = [(x + dx * i, y + dy * i) | i <- [0..len - 1]]
          charAt r c = case findIndex (==(r, c)) idx of
            Nothing -> grid !! r !! c
            Just i -> word !! i

solve :: [String] -> [String] -> String
solve grid [] = if (or . map (any (=='-')) $ grid) then ""
                else intercalate "\n" $ grid
solve grid (word:ws)
    | length ans1 > 0 = ans1 !! 0
    | length ans2 > 0 = ans2 !! 0
    | otherwise = ""
    where
        indices = [(r, c) | r <- [0..9], c <- [0..9]]
        hi = filter (\idx -> isPossible grid word idx (0, 1)) indices
        vi = filter (\idx -> isPossible grid word idx (1, 0)) indices
        ans1 = filter (\sol -> length sol > 0) $ map (\idx -> solve (putWords grid word idx (0, 1)) ws) hi
        ans2 = filter (\sol -> length sol > 0) $ map (\idx -> solve (putWords grid word idx (1, 0)) ws) vi

main :: IO ()
main = do
    contents <- getContents
    let
        (grid, wordList':_) = splitAt 10 . words $ contents
        wordList = getWords wordList'
    putStrLn $ solve grid wordList

getWords :: String -> [String]
getWords wordList = pre : if null suc then [] else getWords $ tail suc
    where (pre, suc) = break (\x -> x == ';') wordList
