module Category where

import Data.Aeson
import Data.Text
import Database.SQLite.Simple
import GHC.Generics

data Category = Category { 
  category :: Text, 
  quoteCount :: Int 
} deriving (Show, Eq, Generic)

instance ToJSON Category

instance FromRow Category where
  fromRow = Category <$> field <*> field
