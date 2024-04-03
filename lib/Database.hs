{-# LANGUAGE OverloadedStrings #-}

module Database (connectDb, getRandomQuote) where

import Database.SQLite.Simple
import Quote

connectDb :: String -> IO Connection
connectDb path = open path

getRandomQuote :: Connection -> IO Quote
getRandomQuote conn = do
  [quote] <- query_ conn "SELECT author, quote, category FROM quotes ORDER BY RANDOM() LIMIT 1"
  pure quote
