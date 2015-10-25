win = [[[isWin row1 row2 row3 | row3 <- [0..]] | row2 <- [0..]] | row1 <- [0..]]
    where isWin 0 0 0 = True
          isWin 1 0 0 = False
          isWin r1 r2 r3 = flag1 || flag2 || flag3
            where flag1 = any not [win !! r1 !! r2 !! rr3 | rr3 <- [0..r3 - 1]]
                  flag2 = any not [win !! r1 !! rr2 !! min rr2 r3 | rr2 <- [0..r2 - 1]]
                  flag3 = any not [win !! rr1 !! min rr1 r2 !! min rr1 r3 | rr1 <- [0..r1 - 1]]
                  
validate :: [[Int]] -> [String]
validate ([t] : arr) = map (\[r1, r2, r3] -> if win !! r1 !! r2 !! r3 then "WIN" else "LOSE") arr

main :: IO ()
main = getContents >>= mapM_ putStrLn . validate . map (map read . words) . lines
