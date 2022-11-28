{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module Api where

import           App
import           Colog
import           Config
import           Control.Concurrent.MVar
import           Control.Monad.Reader
import qualified Data.ByteString         as BS
import qualified Data.Text               as T
import qualified Data.Text.Encoding      as E
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
  env <- ask
  liftIO $ withMVar (fileMVar env) $ \_ -> do
    f <- openFile visits_file_path AppendMode
    BS.hPutStr f (E.encodeUtf8 $ T.pack $ "get_time: " <> t <> "\n")
    hClose f

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
  env <- ask
  contents <- liftIO $ withMVar (fileMVar env) $ \_ -> do
    T.unpack . E.decodeUtf8 <$> BS.readFile visits_file_path
  let lineCount = length $ lines contents
  pure $ toHtml ("Total visits: " <> show lineCount <> "\n\n" <> contents)

server :: ServerT Api App
server = getTime :<|> getHealth :<|> getVisits
