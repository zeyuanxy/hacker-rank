--Contributed by Ron Watkins
module Main where


fib n 
    | n <= 2 = n - 1
    | otherwise = fib(n - 1) + fib(n - 2)


-- This part is related to the Input/Output and can be used as it is
-- Do not modify it
main = do
    input <- getLine
    print . fib . (read :: String -> Int) $ input
