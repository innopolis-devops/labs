{-# LANGUAGE DerivingStrategies         #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module App where

import           Config
import           Control.Monad.Except
import           Control.Monad.Reader
import           Servant
import           UnliftIO             hiding (Handler)

newtype AppEnv
  = AppEnv
  { config    :: Config }

newtype App a = App
  { unApp :: ReaderT AppEnv IO a }
  deriving newtype (Functor, Applicative, Monad, MonadIO,
                   MonadUnliftIO, MonadReader AppEnv)

runApp :: AppEnv -> App a -> IO a
runApp env app = runReaderT (unApp app) env

makeAppEnv :: Config -> AppEnv
makeAppEnv config_ = AppEnv { config = config_ }

runHandler :: AppEnv -> App a -> Handler a
runHandler env app = Handler . ExceptT . try $ runApp env app
