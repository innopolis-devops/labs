module Config where

import           Data.Default

data Config
  = Config
  { port           :: Int
  , monitoringPort :: Int
  , timeout        :: Int }

instance Default Config where
  def = Config
    { port = 8080
    , monitoringPort = 8081
    , timeout = 60
    }
