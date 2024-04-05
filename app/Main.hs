module Main where

import Api
import Data.Maybe
import Database
import Network.Wai.Middleware.HealthCheckEndpoint
import Network.Wai.Middleware.RequestLogger
import Network.Wai.Middleware.Static
import System.Environment
import Web.Scotty

main :: IO ()
main = do
  port <- maybe 8080 read <$> lookupEnv "PORT"
  db_path <- fromMaybe "quotes.db" <$> lookupEnv "DB_PATH"
  conn <- connectDb db_path
  scotty port $ do
    middleware logStdoutDev
    middleware healthCheck
    middleware $ staticPolicy (noDots >-> addBase "static")

    setupRoutes conn
