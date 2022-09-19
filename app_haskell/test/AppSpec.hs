module AppSpec where

import qualified Data.ByteString.Lazy as BSL
import           Lens.Micro
import           Network.Wreq         (responseBody, responseStatus, statusCode)
import           Test.Hspec
import           Util

spec :: Spec
spec = do
  around withApp $ do
    mapM_ matchGetResponse params

  where
    params =
      [ ("should return current time", "/",          200, Just "Time in Moscow is")
      , ("",                           "/not-found", 404, Nothing)
      ]

    matchGetResponse (it_, path, status, maybeSubstr) = do
      describe ("GET " <> path) $ do
        it (getIt it_ status) $ \port -> do
          result <- get path port
          result ^? responseStatus . statusCode `shouldBe` Just status
          case maybeSubstr of
            Just s  -> result ^? responseBody `shouldSatisfy` (\(Just t) -> BSL.isPrefixOf s t)
            Nothing -> pure ()

    getIt it_ status = it_ <> (if null it_ then "" else " ") <> "[HTTP" <> show status <> "]"
