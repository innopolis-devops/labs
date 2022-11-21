{-# LANGUAGE DeriveAnyClass      #-}
{-# LANGUAGE DeriveGeneric       #-}
{-# LANGUAGE DerivingStrategies  #-}
{-# LANGUAGE RecordWildCards     #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE StandaloneDeriving  #-}

module Config where

import           Control.Exception
import           Data.Aeson
import qualified Data.ByteString      as BS
import qualified Data.ByteString.Lazy as BSL
import           GHC.Generics         (Generic)

data Config
  = Config
  { port           :: Int
  , monitoringPort :: Int
  , timeout        :: Int
  , visits_file    :: String }

readConfig :: IO Config
readConfig = do
  let port           = 8080
      monitoringPort = 8081
      timeout        = 60
  visits_file <- readVisitsFilePath
  pure Config{..}

  where
    readVisitsFilePath = do
      mvf <- readVisitsFile "/app/config.json"
      case mvf of
        Just vf -> pure $ unVisitFileConfig vf
        Nothing -> pure "data/visits.txt"

newtype VisitFileConfig = VisitFileConfig { unVisitFileConfig :: String }
  deriving stock (Generic)

deriving anyclass instance FromJSON VisitFileConfig

readVisitsFile :: FilePath -> IO (Maybe VisitFileConfig)
readVisitsFile path = do
  contents <- try $ BS.readFile path
  case contents of
    Left (_ :: SomeException) -> pure Nothing
    Right contents'           -> pure $ decode $ BSL.fromStrict contents'
