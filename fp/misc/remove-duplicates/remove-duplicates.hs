import qualified Data.List as L

solve :: String -> String
solve s = L.nub s

main :: IO ()
main = do
    s <- getLine
    putStr $ solve s
