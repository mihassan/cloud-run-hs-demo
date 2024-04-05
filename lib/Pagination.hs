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
  limit <- queryParam "limit" `catchAny` const (return 10)
  return Pagination {..}
