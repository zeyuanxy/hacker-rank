import Control.Monad

hello_worlds n = replicateM_ n (putStrLn "Hello World")

main = do
   n <- readLn :: IO Int
   hello_worlds n
