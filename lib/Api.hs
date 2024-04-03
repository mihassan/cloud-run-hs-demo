{-# LANGUAGE OverloadedStrings #-}

module Api (setupRoutes) where

import Database
import Database.SQLite.Simple
import Web.Scotty

setupRoutes :: Connection -> ScottyM ()
setupRoutes conn = do
  get "/quotes/random" $ do
    quote <- liftIO $ getRandomQuote conn
    json quote
  get "/quotes/:quote_id" $ do
    quote_id <- pathParam "quote_id"
    maybeQuote <- liftIO $ getQuote conn quote_id
    case maybeQuote of
      Just quote -> json quote
      Nothing -> throw . PathParameterNotFound $ "quote_id = " <> quote_id
