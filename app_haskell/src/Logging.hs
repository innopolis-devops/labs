module Logging where

import           Colog
import           Control.Monad.IO.Class (MonadIO, liftIO)
import qualified Data.ByteString        as BS
import qualified Data.ByteString.Char8  as BS8
import           Data.Text.Encoding     (encodeUtf8)
import           System.IO              (hFlush, stdout)

logByteStringStdoutFlush :: MonadIO m => LogAction m BS.ByteString
logByteStringStdoutFlush = LogAction $ \c -> do
  liftIO $ BS8.putStrLn c
  -- quick fix for logs not showing up in docker logs problem
  liftIO $ hFlush stdout

defaultLogAction :: MonadIO m => LogAction m Message
defaultLogAction = upgradeMessageAction defaultFieldMap $
    cmapM (fmap encodeUtf8 . fmtRichMessageDefault) logByteStringStdoutFlush
{-# INLINE defaultLogAction #-}
{-# SPECIALIZE defaultLogAction :: LogAction IO Message #-}
