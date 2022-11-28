{-# LANGUAGE RecordWildCards #-}

module WebApp where

import           Api
import           App
import           Config
import           Control.Concurrent       (forkIO)
import           Data.Function
import qualified Network.Wai.Handler.Warp as Warp
import           Prometheus               (register)
import           Servant
import qualified Servant.Prometheus       as SP

makeWebApp :: AppEnv -> Application
makeWebApp env = serve api $ hoistServer api (App.runHandler env) server

runWebApp :: Config -> IO ()
runWebApp config_@Config{..} = do
  let warpSettings = Warp.defaultSettings
                   & Warp.setPort port
                   & Warp.setTimeout timeout
  env <- makeAppEnv config_

  -- Allocate the counters necessary for all app endpoints.
  meters <- register $ SP.meters api

  -- Fork a separate server for serving nothing but metrics,
  -- which you will point Prometheus at.
  _ <- forkIO $ Warp.run monitoringPort SP.servePrometheusMetrics

  -- Run your app with metric monitoring.
  Warp.runSettings warpSettings $ SP.monitorServant meters $ makeWebApp env
