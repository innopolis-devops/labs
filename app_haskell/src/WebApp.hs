{-# LANGUAGE RecordWildCards #-}

module WebApp where

import           Api
import           App
import           Config
import           Data.Function
import qualified Network.Wai.Handler.Warp as Warp
import           Servant

makeWebApp :: AppEnv -> Application
makeWebApp env = serve api $ hoistServer api (App.runHandler env) server

runWebApp :: Config -> IO ()
runWebApp config_@Config{..} = do
  let warpSettings = Warp.defaultSettings
                   & Warp.setPort port
                   & Warp.setTimeout 60
  let env = makeAppEnv config_
  Warp.runSettings warpSettings $ makeWebApp env
