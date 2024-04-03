{-# LANGUAGE OverloadedStrings #-}

module Api (setupRoutes) where

import Database
import Web.Scotty
import Database.SQLite.Simple

setupRoutes :: Connection -> ScottyM ()
setupRoutes conn = do
  get "/" $ do
    quote <- liftIO $ getRandomQuote conn
    json quote
