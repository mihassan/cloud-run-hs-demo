module Main where

import MyLib (getRandomQuote)

main :: IO ()
main = do
  quote <- getRandomQuote
  putStrLn quote
