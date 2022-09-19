module Util where

import           App
import           Control.Exception
import qualified Data.ByteString.Lazy     as BSL
import           Data.Default
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

  let config_ = def
  let env     = makeAppEnv config_
  let app     = makeWebApp env

  Warp.testWithApplication (pure app) action

baseUrl :: String
baseUrl = "http://localhost"

get :: String -> Int -> IO (Response BSL.ByteString)
get path port = Wreq.get url `catch` errorHandler
  where
    url = baseUrl <> ":" <> show port <> path

    errorHandler (HttpExceptionRequest _ (StatusCodeException r _)) = pure $ r { responseBody = "" }
    errorHandler err                       = error $ show err
