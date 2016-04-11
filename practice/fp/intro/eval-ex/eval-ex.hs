fac :: Double -> Double
fac 0 = 1
fac x = x * (fac (x - 1))

solve :: Double -> Double
solve x = sum [(x ** i) / fac(i)| i <- [0..9]]

main :: IO ()
main = getContents >>= mapM_ print. map solve. map (read::String->Double). tail. words
