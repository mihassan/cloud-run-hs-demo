{-# LANGUAGE OverloadedStrings #-}

module Api (setupRoutes) where

import Database
import Database.SQLite.Simple
import Network.HTTP.Types.Status
import Web.Scotty

setupRoutes :: Connection -> ScottyM ()
setupRoutes conn = do
  get "/" $ do status status200

  get "/quotes/random" $ do
    maybeQuote <- liftIO $ getRandomQuote conn
    case maybeQuote of
      Just quote -> json quote
      Nothing -> status status404

  get "/quotes/:quote_id" $ do
    quote_id <- pathParam "quote_id"
    maybeQuote <- liftIO $ getQuote conn quote_id
    case maybeQuote of
      Just quote -> json quote
      Nothing -> status status404

  get "/categories/:category/quotes/random" $ do
    category <- pathParam "category"
    maybeQuote <- liftIO $ getRandomQuoteByCategory conn category
    case maybeQuote of
      Just quote -> json quote
      Nothing -> status status404

  get "/categories" $ do
    categories <- liftIO $ getCategories conn
    json categories
