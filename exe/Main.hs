{-# LANGUAGE OverloadedStrings #-}

module Main where

import Quote (getRandomQuote)
import Web.Scotty

main :: IO ()
main = scotty 3000 $ do
  get "/" $ do
    quote <- liftIO getRandomQuote
    json quote
