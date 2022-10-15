{-# LANGUAGE DataKinds #-}

module Api where

import           App
import           Colog
import           Data.Time
import           Lucid
import           Servant
import           Servant.HTML.Lucid
import           UnliftIO

type Api = Get '[HTML] (Html ())

api :: Proxy Api
api = Proxy

getTime :: App (Html ())
getTime = do
  moscowTime <- liftIO getMoscowTime
  logInfo "Time request"
  let responseString = "Time in Moscow is " <> fmtTime moscowTime :: String
  pure $ toHtml responseString

  where
    getMoscowTime = utcToZonedTime tz <$> getCurrentTime
    fmtTime = formatTime defaultTimeLocale "%H:%M:%S"
    tz = TimeZone (3 * 60) False "Europe/Moscow"

server :: ServerT Api App
server = getTime
