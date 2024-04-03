{-# LANGUAGE OverloadedStrings #-}

module Database (connectDb, getQuote, getRandomQuote, getRandomQuoteByCategory) where

import Data.Maybe
import Data.Text
import Database.SQLite.Simple
import Quote

connectDb :: String -> IO Connection
connectDb path = open path

getQuote :: Connection -> Text -> IO (Maybe Quote)
getQuote conn quote_id = do
  quote <- listToMaybe <$> query conn "SELECT quote_id, author, quote, category FROM quotes WHERE quote_id = ?" (Only quote_id)
  pure quote

getRandomQuote :: Connection -> IO Quote
getRandomQuote conn = do
  [quote] <- query_ conn "SELECT quote_id, author, quote, category FROM quotes ORDER BY RANDOM() LIMIT 1"
  pure quote

getRandomQuoteByCategory :: Connection -> Text -> IO (Maybe Quote)
getRandomQuoteByCategory conn category = do
  quote <- listToMaybe <$> query conn "SELECT quote_id, author, quote, category FROM quotes WHERE category = ? ORDER BY RANDOM() LIMIT 1" (Only category)
  pure quote
