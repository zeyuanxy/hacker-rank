import qualified Data.Vector as V

inf = 10^8 :: Int

calc :: Int -> V.Vector Int -> Int
calc len arr = minimum [table V.! (len - 1) V.! ll V.! rr | ll <- [0..9], rr <- [0..9]]
    where table = V.fromList [ V.fromList [ V.fromList[dp nn ll rr | rr <- [0..9]] | ll <- [0..9] ] | nn <- [0..len - 1] ]
          dp n l r 
            | n == 0 = if l == x || r == x then 1 else inf
            | l == x && r == x = min lAns rAns
            | l == x = lAns
            | r == x = rAns
            | otherwise = inf
            where x = arr V.! n
                  lAns = minimum [table V.! (n - 1) V.! ll V.! r + abs (ll - x) + 1| ll <- [0..9]]
                  rAns = minimum [table V.! (n - 1) V.! l V.! rr + abs (rr - x) + 1| rr <- [0..9]]
          

solve :: [[Int]] -> Int
solve ([n] : arr : _) = calc (length arr) (V.fromList . map (\x -> (x + 9) `rem` 10) $ arr)

main :: IO ()
main = getContents >>= putStrLn . show . solve . map (map read . words) . lines
