{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module Api where

import           App
import           Colog
import           Config
import           Control.Monad.Reader
import           Data.Time
import           Lucid
import           Servant
import           Servant.HTML.Lucid
import           System.IO

type Api = Get '[HTML] (Html ())
      :<|> "health" :> Get '[HTML] (Html ())
      :<|> "visits" :> Get '[HTML] (Html ())

api :: Proxy Api
api = Proxy

logVisit :: String -> App ()
logVisit t = do
  visits_file_path <- asks (visits_file . config)
  liftIO $ do
    f <- openFile visits_file_path AppendMode
    hPutStrLn f ("get_time: " <> t)

getTime :: App (Html ())
getTime = do
  moscowTime <- liftIO getMoscowTime
  logInfo "Time request"
  let t = fmtTime moscowTime
  let responseString = "Time in Moscow is " <> t :: String
  logVisit t
  pure $ toHtml responseString

  where
    getMoscowTime = utcToZonedTime tz <$> getCurrentTime
    fmtTime = formatTime defaultTimeLocale "%H:%M:%S"
    tz = TimeZone (3 * 60) False "Europe/Moscow"

getHealth :: App (Html ())
getHealth = do
  logInfo "Health request"
  pure $ toHtml ("Up" :: String)

getVisits :: App (Html ())
getVisits = do
  logInfo "Visits request"
  visits_file_path <- asks (visits_file . config)
  contents <- liftIO $ readFile visits_file_path
  pure $ toHtml (contents :: String)

server :: ServerT Api App
server = getTime :<|> getHealth :<|> getVisits
