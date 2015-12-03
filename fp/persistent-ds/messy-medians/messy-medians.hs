import qualified Data.Vector as V
import qualified Data.Map.Strict as Map
import Text.Printf

data MSet a = MSet {
    set :: Map.Map a a,
    size :: Int
}

emptyMSet :: MSet a
emptyMSet = MSet Map.empty 0

addToSet, removeFromSet :: (Num a, Ord a) => a -> MSet a -> MSet a
addToSet x (MSet set size) = MSet (Map.insertWith (+) x 1 set) (size + 1)
removeFromSet x (MSet set size) = MSet (Map.update sub x set) (size - 1)
    where sub v = if v == 1 then Nothing else Just (v - 1)
    
data Container a = Container {
    firstSet :: MSet a,
    secondSet :: MSet a
}

emptyContainer :: Container a
emptyContainer = Container emptyMSet emptyMSet

addToContainer :: (Num a, Ord a)  => a -> Container a -> Container a
addToContainer x container
    | size1 == size2 = do
        let midSet2                 = addToSet x set2
            xx                      = fst . Map.findMin . set $ midSet2
            newSet2                 = removeFromSet xx midSet2
            newSet1                 = addToSet xx set1
        Container newSet1 newSet2
    | otherwise = do
        let midSet1                 = addToSet x set1
            xx                      = fst . Map.findMax . set $ midSet1
            newSet1                 = removeFromSet xx midSet1
            newSet2                 = addToSet xx set2
        Container newSet1 newSet2
    where size1                     = size . firstSet $ container
          size2                     = size . secondSet $ container
          set1                      = firstSet container
          set2                      = secondSet container
          
getMedian :: (Num a, Ord a) => Container a -> a
getMedian = fst . Map.findMax . set . firstSet

validate (n:a) = containers
    where v = V.fromList a
          containers = V.fromList $ emptyContainer : [getContainer i | i <- [1..n]]
          getContainer idx
            | val >= 0 = addToContainer val (containers V.! (idx - 1))
            | val < 0 = containers V.! (idx + val)
            where val = v V.! (idx - 1)

main :: IO ()
main = do
    getContents >>= mapM_ (print . getMedian) . tail . V.toList . validate . map read . lines
    
