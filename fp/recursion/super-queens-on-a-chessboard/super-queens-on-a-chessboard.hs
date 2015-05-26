conflict :: Int -> Int -> Int -> Int -> Bool
conflict x y i j
    | (i == x) || (j == y) = True
    | (i + j) == (x + y) = True
    | (i - j) == (x - y) = True
    | (abs (i - x) + abs (j - y)) == 3 = True
    | otherwise = False

search :: Int -> Int -> [(Int, Int)] -> Int
search depth n queens = if depth == n then 1
                        else sum [search_pos depth y n queens | y <- [0..n - 1]]

search_pos :: Int -> Int -> Int -> [(Int, Int)] -> Int
search_pos x y n queens = if (any (\(i, j) -> conflict x y i j) queens) then 0
                         else search (x + 1) n ((x, y):queens)
          
solve :: Int -> Int
solve n = search 0 n []


main = do
    input <- getLine
    let 
        n = read input
    print $ solve n
