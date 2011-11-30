-- runhaskell fibonacci_backoff.hs

import qualified Control.Concurrent as C
import qualified Control.Monad as M

fibs :: [Int]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

backoff :: [IO ()]
backoff = map (\sleep_time ->
  do putStrLn ("Sleeping for " ++ (show sleep_time) ++ "s")
     C.threadDelay (sleep_time * 1000000)) fibs

main :: IO ()
main = sequence_ backoff
