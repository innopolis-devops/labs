module Util where

import           App
import           Config
import           Control.Exception
import qualified Data.ByteString.Lazy     as BSL
import           Network.HTTP.Client      (HttpException (..),
                                           HttpExceptionContent (..),
                                           responseBody)
import qualified Network.Wai.Handler.Warp as Warp
import           Network.Wreq             (Response)
import qualified Network.Wreq             as Wreq
import           WebApp

withApp :: (Warp.Port -> IO ()) -> IO ()
withApp action = do
  -- testWithApplication makes sure the action is executed after the server has
  -- started and is being properly shutdown.
  config_ <- readConfig
  createVisitsDirectoryIfMissing config_
  env <- makeAppEnv config_
  let app = makeWebApp env

  Warp.testWithApplication (pure app) action

baseUrl :: String
baseUrl = "http://localhost"

get :: String -> Int -> IO (Response BSL.ByteString)
get path port_ = Wreq.get url `catch` errorHandler
  where
    url = baseUrl <> ":" <> show port_ <> path

    errorHandler (HttpExceptionRequest _ (StatusCodeException r _)) = pure $ r { responseBody = "" }
    errorHandler err                       = error $ show err
