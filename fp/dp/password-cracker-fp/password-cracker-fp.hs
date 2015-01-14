import Data.List

solve :: [String] -> String -> String
solve _ [] = "$"
solve pass login = head dp
            where n = length login
                  dp = [getDP ii | ii <- [0..n - 1]]
                    where getDP i = if null candidate then "WRONG PASSWORD" else head candidate
                            where sub_login = drop i login
                                  check p = if p `isPrefixOf` sub_login then
                                                if length p == length sub_login then p
                                                else if dp !! (i + length p) == "WRONG PASSWORD" then "WRONG PASSWORD"
                                                     else p ++ " " ++ dp !! (i + length p)
                                            else "WRONG PASSWORD"
                                  candidate = filter (\s -> if s == "WRONG PASSWORD" then False else True) [check pp | pp <- pass]

validate :: [String] -> [String]
validate (_:rest) = parse rest
            where parse [] = []
                  parse (n':pass':login:rest) = solve pass login : parse rest
                    where n = read n' :: Int
                          pass = words pass'
               
        
main :: IO ()
main = getContents >>= mapM_ putStrLn . validate . lines