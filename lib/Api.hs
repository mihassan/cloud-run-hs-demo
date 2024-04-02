{-# LANGUAGE OverloadedStrings #-}

module Api (setupRoutes) where

import Database
import Web.Scotty

setupRoutes :: ScottyM ()
setupRoutes = do
  get "/" $ do
    quote <- liftIO getRandomQuote
    json quote
