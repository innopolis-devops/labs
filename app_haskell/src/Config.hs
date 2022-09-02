module Config where

import           Data.Default

newtype Config
  = Config
  { port :: Int }

instance Default Config where
  def = Config { port = 8080 }
