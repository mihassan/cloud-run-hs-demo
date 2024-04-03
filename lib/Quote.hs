module Quote (Quote (..)) where

import Data.Aeson
import Data.Text
import Database.SQLite.Simple
import GHC.Generics

data Quote = Quote
  { author :: Text,
    quote :: Text,
    category :: Text
  }
  deriving (Show, Eq, Generic)

instance ToJSON Quote

instance FromRow Quote where
  fromRow = Quote <$> field <*> field <*> field
