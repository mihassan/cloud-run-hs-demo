{-# LANGUAGE OverloadedStrings #-}

module Main where

import Quote
import System.Environment
import Web.Scotty

main :: IO ()
main = do
  port <- maybe 8080 read <$> lookupEnv "PORT"
  scotty port $ do
    get "/" $ do
      quote <- liftIO getRandomQuote
      json quote

lookupPort :: IO Int
lookupPort = maybe 8080 read <$> lookupEnv "PORT"
