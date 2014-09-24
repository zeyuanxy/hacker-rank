rev l = if (length l) > 1 then [last l] ++ (rev (init l)) else [head l]

main = do
		inputdata <- getContents
		mapM_ putStrLn $ map show $ rev $ map (read :: String -> Int) $ lines inputdata