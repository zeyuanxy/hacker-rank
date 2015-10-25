fn n = [1..n]

main = do
n <- readLn :: IO Int
print (length(fn(n)))