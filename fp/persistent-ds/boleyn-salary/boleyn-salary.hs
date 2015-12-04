-- @Author: Zeyuan Shang
-- @Date:   2015-12-04 01:40:40
-- @Last Modified by:   Zeyuan Shang
-- @Last Modified time: 2015-12-04 02:22:58


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