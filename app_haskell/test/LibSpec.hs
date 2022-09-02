module LibSpec where

import           Test.Hspec
import           Test.QuickCheck

spec :: Spec
spec = do
  describe "Tests for Lib module" $ do
    it "1 ^ 100 = 100" $ do
      1 ^ 100 `shouldBe` 1

    it "a * 0 = 0" $
      property $ \x ->
        (x * 0 :: Int) == 0
