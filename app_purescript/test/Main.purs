module Test.Main where



import Affjax (printError) as AX
import Affjax.Node (get) as AN
import Affjax.ResponseFormat (document) as AXRF
import Data.Either (Either(..), either)
import Data.Maybe (maybe)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Aff.Class (liftAff)
import Effect.Class (liftEffect)
import Effect.Class.Console (log)
import Prelude
import Test.Spec (describe, it)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner (runSpec)
import Web.DOM.Document (toNonElementParentNode)
import Web.DOM.Element (toNode)
import Web.DOM.Node (nodeValue)
import Web.DOM.NonElementParentNode (getElementById)

-- TODO fix the test after the authors close
-- https://github.com/purescript-contrib/purescript-affjax-node/issues/7
main :: Effect Unit
main = launchAff_ $ runSpec [consoleReporter] do
  describe "get" do
    it "get /" do
      -- this is a Node app due to parcel
      -- https://github.com/purescript-contrib/purescript-affjax-node/blob/v1.0.0/src/Affjax/Node.purs#L29-L29
      resp <-  liftAff $ AN.get AXRF.document "http://0.0.0.0:1234/"
      log $ either AX.printError (\x -> x.statusText) resp

      res <- case resp of
        Left l -> pure $ Left $ AX.printError l
        Right r -> do
          let nonParent = toNonElementParentNode r.body
          liftEffect $ getElementById "h1" nonParent >>= 
            (\x -> pure $ maybe (Left "no such id") (\y -> Right $ toNode y ) x)
      
      txt <-
        case res of
          Left l -> pure $ Left l
          Right r -> do
            txt <- liftEffect $ nodeValue r
            pure $ maybe (Left "no text") Right txt
      log $ either identity identity txt
