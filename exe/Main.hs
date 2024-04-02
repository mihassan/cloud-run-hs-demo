{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Maybe
import Quote
import System.Environment
import Web.Scotty

main :: IO ()
main = do
  port <- lookupPort
  scotty port $ do
    get "/" $ do
      quote <- liftIO getRandomQuote
      json quote

lookupPort :: IO Int
lookupPort = do
  portStr <- fromMaybe "8080" <$> lookupEnv "PORT"
  return $ read portStr
