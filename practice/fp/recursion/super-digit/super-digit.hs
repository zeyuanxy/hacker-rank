import Data.Char
import qualified Data.List as L

digitSum :: String -> String
digitSum = show . sum . map digitToInt

superDigit :: String -> String
superDigit x = if length x == 1 then x
               else superDigit $ digitSum x

main :: IO()
main = do
    line <- getLine
    let
        w = L.words line
        n = w !! 0
        k = w !! 1
        d = show $ (read k) * (read $ digitSum n)
    putStr $ superDigit d
