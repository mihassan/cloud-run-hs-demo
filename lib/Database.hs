{-# LANGUAGE OverloadedStrings #-}

module Database (connectDb, getQuote, getRandomQuote) where

import Data.Maybe
import Data.Text
import Database.SQLite.Simple
import Quote

connectDb :: String -> IO Connection
connectDb path = open path

getRandomQuote :: Connection -> IO Quote
getRandomQuote conn = do
  [quote] <- query_ conn "SELECT quote_id, author, quote, category FROM quotes ORDER BY RANDOM() LIMIT 1"
  pure quote

getQuote :: Connection -> Text -> IO (Maybe Quote)
getQuote conn quote_id = do
  quote <- listToMaybe <$> query conn "SELECT quote_id, author, quote, category FROM quotes WHERE quote_id = ?" (Only quote_id)
  pure quote
