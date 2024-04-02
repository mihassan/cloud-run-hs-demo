module Service (getQuote) where

import Db
import Quote
import System.Random

getQuote :: IO Quote
getQuote = do
  randomIndex <- randomRIO (0, length quotes - 1)
  return (quotes !! randomIndex)
