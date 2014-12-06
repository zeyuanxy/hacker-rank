import Text.Printf (printf)

-- This function should return a list [area, volume].
solve :: Int -> Int -> [Int] -> [Int] -> [Double]
solve l r a b = [ans1, ans2]
	where
		ans1 = sum [sum [(fromIntegral ai) * ((fromIntegral x / 1000) ** (fromIntegral bi)) | (ai, bi) <- zip a b] | x <- [l * 1000 .. r * 1000]] / 1000
		ans2 = pi * sum [(sum [(fromIntegral ai) * ((fromIntegral x / 1000) ** (fromIntegral bi)) | (ai, bi) <- zip a b]) ** 2 | x <- [l * 1000 .. r * 1000]] / 1000

--Input/Output.
main :: IO ()
main = getContents >>= mapM_ (printf "%.1f\n"). (\[a, b, [l, r]] -> solve l r a b). map (map read. words). lines
