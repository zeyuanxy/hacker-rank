check :: [Int] -> [Int] -> Int -> String
check [] _ _ = "YES"
check (x:xs) stack lower = if x < lower then "NO"
                           else check xs new_stack new_lower
                            where (first, second) = break (>= x) stack
                                  new_lower = if null first then lower else last first
                                  new_stack = x:second

solve :: [[Int]] -> [String]
solve (_ : _ : x : xs) = check x [] 0 : solve_rest xs
                        where solve_rest (_ : rx : rxs) = check rx [] 0 : solve_rest rxs
                              solve_rest _ = []
        
main :: IO ()
main = getContents >>= mapM_ putStrLn . solve . map (map read . words) . lines