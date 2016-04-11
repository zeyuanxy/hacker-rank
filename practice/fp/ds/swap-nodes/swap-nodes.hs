data BinaryTree a = Node a (BinaryTree a) (BinaryTree a)
                    | Empty
                    
createTree :: Int -> [[Int]] -> BinaryTree Int
createTree n arr = head subtrees
    where subtrees = [getSubtree x | x <- [0..n - 1]]
          getSubtree x = (\[l, r] -> Node (x + 1) l r) . map (\x -> if x == -1 then Empty else subtrees !! (x - 1)) $ arr !! x
          
swapTree :: Int -> BinaryTree Int -> BinaryTree Int
swapTree k = swap 1
    where swap _ Empty = Empty
          swap h (Node x l r)
            | h `rem` k == 0 = Node x (swap (h + 1) r) (swap (h + 1) l)
            | otherwise = Node x (swap (h + 1) l) (swap (h + 1) r)

inorder :: BinaryTree Int -> [Int]
inorder Empty = []
inorder (Node x l r) = inorder l ++ [x] ++ inorder r

solve :: [Int] -> BinaryTree Int -> IO ()
solve [] tree = return ()
solve (k:ks) tree = putStrLn (unwords . map show . inorder $ ans) >> solve ks ans
    where ans = swapTree k tree

validate :: [[Int]] -> IO ()
validate ([n]:rest) = solve k tree
    where (arr, t:k) = (\(f, s) -> (f, concat s)) . splitAt n $ rest
          tree = createTree n arr

main :: IO ()
main = getContents >>= validate . map (map read . words) . lines
