{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module Database (connectDb, getQuotes, getQuote, getRandomQuote, getCategories, getQuotesByCategory, getRandomQuoteByCategory) where

import Category
import Data.Maybe
import Data.Text
import Database.SQLite.Simple
import Pagination
import Quote

connectDb :: String -> IO Connection
connectDb path = open path

getQuotes :: Connection -> Pagination -> IO [Quote]
getQuotes conn Pagination {..} = query conn "SELECT quote_id, author, quote, category FROM quotes LIMIT ? OFFSET ?" (limit, offset)

getQuote :: Connection -> Text -> IO (Maybe Quote)
getQuote conn quote_id = listToMaybe <$> query conn "SELECT quote_id, author, quote, category FROM quotes WHERE quote_id = ?" (Only quote_id)

getRandomQuote :: Connection -> IO (Maybe Quote)
getRandomQuote conn = listToMaybe <$> query_ conn "SELECT quote_id, author, quote, category FROM quotes ORDER BY RANDOM() LIMIT 1"

getCategories :: Connection -> IO [Category]
getCategories conn = query_ conn "SELECT category, quoteCount FROM categories"

getQuotesByCategory :: Connection -> Text -> Pagination -> IO [Quote]
getQuotesByCategory conn category Pagination {..} = query conn "SELECT quote_id, author, quote, category FROM quotes WHERE category = ? LIMIT ? OFFSET ?" (category, limit, offset)

getRandomQuoteByCategory :: Connection -> Text -> IO (Maybe Quote)
getRandomQuoteByCategory conn category = listToMaybe <$> query conn "SELECT quote_id, author, quote, category FROM quotes WHERE category = ? ORDER BY RANDOM() LIMIT 1" (Only category)
