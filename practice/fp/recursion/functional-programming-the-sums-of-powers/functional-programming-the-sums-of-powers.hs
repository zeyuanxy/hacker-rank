solve :: Int -> Int -> Int -> Int
solve 0 _ _ = 1
solve x n m = if x >= m^n then p1 + p2
              else 0
                where p1 = solve (x - m^n) n (m + 1)
                      p2 = solve x n (m + 1)

main :: IO()
main = do
    x <- getLine
    n <- getLine
    print $ solve (read x :: Int) (read n :: Int) 1
