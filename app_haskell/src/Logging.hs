{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE ViewPatterns    #-}

module Logging where

import qualified Chronos                    as C
import           Colog
import           Control.Concurrent         (ThreadId)
import           Control.Monad.IO.Class     (MonadIO (..))
import           Data.Text                  (Text)
import qualified Data.Text                  as T
import           Data.Text.Encoding
import           Data.Text.Lazy             (toStrict)
import qualified Data.Text.Lazy.Builder     as TB
import qualified Data.Text.Lazy.Builder.Int as TB

square :: Text -> Text
square t = "[" <> t <> "] "

showThreadId :: ThreadId -> Text
showThreadId = square . T.pack . show

{- | Given a 'Datetime', constructs a 'Text' 'TB.Builder' corresponding to a
Year\/Month\/Day,Hour\/Minute\/Second\/Offset encoding of the given 'Datetime'.

Example: @2019-12-29 22:00:00.000 +00:00@
-}
builderYMDHMSz :: C.Datetime -> TB.Builder
builderYMDHMSz (C.Datetime date time) =
       builderYMD date
    <> spaceSep
    <> C.builder_HMS (C.SubsecondPrecisionFixed 3) (Just ':') time
    <> spaceSep
    <> C.builderOffset C.OffsetFormatColonOn (C.Offset 0)
  where
    spaceSep :: TB.Builder
    spaceSep = TB.singleton ' '

    dashSep :: TB.Builder
    dashSep = TB.singleton '-'

    {- | Given a 'Date' construct a 'Text' 'TB.Builder'
    corresponding to a Year\/Month\/Day encoding.

    Example: @2020-12-31@
    -}
    builderYMD :: C.Date -> TB.Builder
    builderYMD (C.Date (C.Year y) (C.Month m) (C.DayOfMonth d)) =
           TB.decimal y
        <> dashSep
        <> zeroPad m
        <> dashSep
        <> zeroPad d

    zeroPad :: Int -> TB.Builder
    zeroPad x
      | x < 10    = TB.singleton '0' <> TB.decimal x
      | otherwise = TB.decimal x

{-
>>> showTime $ C.Time 1577656800
[2019-12-29 22:00:00.000 +00:00]
-}
showTime :: C.Time -> Text
showTime t =
    square
    $ toStrict
    $ TB.toLazyText
    $ builderYMDHMSz (C.timeToDatetime t)

fmtMessageDefault :: MonadIO m => RichMessage m -> m Text
fmtMessageDefault msg = fmtRichMessageCustomDefault msg formatRichMessage
  where
    formatRichMessage :: Maybe ThreadId -> Maybe C.Time -> Message -> Text
    formatRichMessage (maybe "" showThreadId -> thread) (maybe "" showTime -> time) Msg{..} =
        showSeverity msgSeverity
     <> time
     <> showSourceLoc msgStack
     <> thread
     <> msgText

defaultLogAction :: MonadIO m => LogAction m Message
defaultLogAction = upgradeMessageAction defaultFieldMap $
    cmapM (fmap encodeUtf8 . fmtMessageDefault) logByteStringStdout
{-# INLINE defaultLogAction #-}
{-# SPECIALIZE defaultLogAction :: LogAction IO Message #-}
