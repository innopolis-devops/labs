{-# LANGUAGE DerivingStrategies         #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE InstanceSigs               #-}
{-# LANGUAGE MultiParamTypeClasses      #-}

module App where

import           Colog
import           Config
import           Control.Monad.Except
import           Control.Monad.Reader
import           Logging
import           Servant
import           UnliftIO             hiding (Handler)

data AppEnv
  = AppEnv
  { config    :: Config
  , logAction :: LogAction App Message
  , fileMVar  :: MVar ()
  }

newtype App a = App
  { unApp :: ReaderT AppEnv IO a }
  deriving newtype (Functor, Applicative, Monad, MonadIO,
                   MonadUnliftIO, MonadReader AppEnv)

instance HasLog AppEnv Message App where
  getLogAction :: AppEnv -> LogAction App Message
  getLogAction = logAction
  {-# INLINE getLogAction #-}

  setLogAction :: LogAction App Message -> AppEnv -> AppEnv
  setLogAction newLogAction env = env { logAction = newLogAction }
  {-# INLINE setLogAction #-}

runApp :: AppEnv -> App a -> IO a
runApp env app = runReaderT (unApp app) env

makeAppEnv :: Config -> IO AppEnv
makeAppEnv config_ = do
  fileMVar_ <- newMVar ()
  pure $ AppEnv
    { config    = config_
    , logAction = defaultLogAction
    , fileMVar  = fileMVar_
    }

runHandler :: AppEnv -> App a -> Handler a
runHandler env app = Handler . ExceptT . try $ runApp env app
