import qualified Data.Vector as V
import qualified Data.PQueue as PQueue
import Text.Printf

data MSet a = MSet {
    set :: MultiSet.MultiSet a,
    size :: Int
}

emptyMSet :: MSet a
emptyMSet = MSet MultiSet.empty 0

addToSet, removeFromSet :: (Show a, Ord a) => a -> MSet a -> MSet a
addToSet x (MSet set size) = MSet (MultiSet.insert x set) (size + 1)
removeFromSet x (MSet set size) 
    | MultiSet.member x set = MSet (MultiSet.delete x set) (size - 1)
    | otherwise = MSet set size

data Container a = Container {
    firstSet :: MSet a,
    secondSet :: MSet a
}

emptyContainer :: Container Int
emptyContainer :: Container emptyMSet emptyMSet

addToContainer :: (Show a, Ord a)  => a -> Container a -> Container a
addToContainer x container
    | size1 == size2 = do
        let midSet2                 = addToSet x set2
            xx                      = MultiSet.findMin . set $ midSet2
            newSet2                 = removeFromSet xx midSet2
            newSet1                 = addToSet x set1
        Container newSet1 newSet2
    | otherwise = do
        let midSet1                 = addToSet x set1
            xx                      = MultiSet.findMax . set $ midSet1
            newSet1                 = removeFromSet xx midSet1
            newSet2                 = addToSet x set2
        Container newSet1 newSet2
    where size1                     = size . firstSet $ container
          size2                     = size . secondSet $ container
          set1                      = firstSet container
          set2                      = secondSet container
          
getMedian :: (Show a, Ord a) => Container a -> a
getMedian = MultiSet.findMax . set . firstSet

validate (n:a) = containers
    where v = V.fromList a
          containers = V.fromList $ emptyContainer : [getContainer i | i <- [1..n]]
          getContainer idx
            | val >= 0 = addToContainer val (containers V.! (idx - 1))
            | val < 0 = containers V.! (idx + val)
            where val = v V.! (idx - 1)

main = do
    getContents >>= mapM_ (print . getMedian)  tail . V.toList . validate . map read . lines
