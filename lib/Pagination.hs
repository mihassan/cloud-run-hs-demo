{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module Pagination (Pagination (..), getPagination) where

import UnliftIO.Exception
import Web.Scotty

data Pagination = Pagination
  { offset :: Int,
    limit :: Int
  }
  deriving (Show, Eq)

getPagination :: ActionM Pagination
getPagination = do
  offset <- queryParam "offset" `catchAny` const (return 0)
  limit' <- queryParam "limit" `catchAny` const (return 10)
  -- Set a maximum limit of 100 to prevent abuse.
  let limit = min 100 limit'
  return Pagination {..}
