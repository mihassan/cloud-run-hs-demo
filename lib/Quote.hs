module Quote (Quote (..)) where

import Data.Aeson
import Data.Text
import GHC.Generics

data Quote = Quote
  { author :: Text,
    quote :: Text,
    category :: Text
  }
  deriving (Show, Eq, Generic)

instance ToJSON Quote
