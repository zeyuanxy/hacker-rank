-- @Author: Zeyuan Shang
-- @Date:   2015-12-04 01:40:40
-- @Last Modified by:   Zeyuan Shang
-- @Last Modified time: 2015-12-04 02:47:01
import Control.Monad
import Data.Graph
import qualified Data.Array as A
import qualified Data.IntMap as M


----- naive AVL -----
data AVLTree a = Null | Node a (AVLTree a) (AVLTree a) Int Int -- height size
                 deriving Show
                 
left Null = 0
left (Node _ l _ _ _) = l

right Null = 0
right (Node _ _ r _ _) = r

height Null = 0
height (Node _ _ _ h _) = h

size Null = 0
size (Node _ _ _ _ s) = s

weight Null = 0
weight (Node _ l r _ s) = (height l) - (height r)

update Null = 0
update (Node root l r _ _) = Node root l r (1 + max (height l) (height r)) (1 + max (size l) (size r))

leftRotate Null = Null
leftRotate (Node root l r h s) = update $ Node r newLeft (right r) 0 0
	where newLeft = update $ Node root l (left r) 0 0

rightRotate Null = Null
rightRotate (Node root l r h s) = update $ Node l (left l) newRight 0 0
	where newRight = update $ Node root (right l) r 0 0

balance Null = Null
balance (Node root l r h s)
	| abs w <= 1 = root
	| w > 0 = if weight l < 0 then rightRotate $ Node root newLeft r h s
			  else rightRotate $ Node root l r h s
	| otherwise = if weight r > 0 then leftRotate $ Node root l newRight h s
				  else leftRotate $ Node root l r h s
	where w = weight root
		  newLeft = leftRotate l
		  newRight = rightRotate r

insert :: (Ord a) => AVLTree a -> a -> AVLTree a
insert Null value = Node value Null Null 1 1
insert (Node root l r h s) value = balance . update $ Node root newLeft newRight h s
	where newLeft = if value < this then insert l value else l
		  newRight = if value < this then r else insert r value

select :: AVLTree a -> Int -> a -- find kth element in the AVL tree
select Null k = error "null"
select (Node root l r _ _) k 
	| rank == k = root
	| rank > k = select l k
	| otherwise = select r (k - rank)
	where rank = 1 + size l

----- naive AVL -----

----- main -----

toTwo [] = []
toTwo (x:y:rs) = (y, x):toTwo rs

walk Null = []
walk (Node root l r _ _) = this : walk l ++ walk r

merge ta tb
	| size ta >= size tb = foldl insert ta (walk tb)
	| otherwise = merge tb ta

build :: A.Array Int Int -> Graph -> M.IntMap (AVLTree (Int, Int)) -> Int -> M.IntMap (AVLTree (Int, Int))
build salaries graph m u = let vs = g A.! u
						   	   ut = foldl1 merge $ (foldl insert Null [(salaries A.! v, v) | v <- vs]) 
						   	   : [m M.! v | v <- vs]
						   	in M.insert u ut m

main :: IO ()
main = do
	inputs <- getContents >>= return . map (read :: String -> Int) . words
	let (n:m:rest) = inputs
		(edges', rest') = splitAt (2 * (n - 1)) rest
		edges = toTwo edges'
		(salaries', rest'') = splitAt n rest'
		queries = toTwo rest''

		graph = buildG (1, n) edges'
		salaries = A.listArray (1, n) salaries

		build' = build salaries graph
		topOrder = reverse $ topSort graph
		trees = M.toAscList $ foldl build' M.empty topOrder
		vecs = A.array (1, n) trees
		results = tail $ scanl (\n (k, u) -> snd $ select (vecs A.! (n + u)) k) 0 queries
	mapM_ print results
----- main -----