module Main where

import Api
import System.Environment
import Web.Scotty

main :: IO ()
main = do
  port <- maybe 8080 read <$> lookupEnv "PORT"
  scotty port setupRoutes
