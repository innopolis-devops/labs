module Test.Main where


import Affjax (printError, request, defaultRequest) as AX
import Affjax.RequestBody as AXRF
import Affjax.ResponseFormat (document, string) as AXRF
import Data.Either (Either(..), either)
import Data.Maybe (maybe, Maybe(..))
import Effect.Class (liftEffect)
import Web.DOM.Document (toNonElementParentNode)
import Web.DOM.Element (toNode)
import Web.DOM.Node (nodeValue)
import Web.DOM.NonElementParentNode (getElementById)
import Data.HTTP.Method (Method(..))
import Affjax.RequestBody (document) as ARB
import Effect.Aff (launchAff_, Aff)
import Test.Spec (describe, it)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner (runSpec)

import Prelude
import Effect (Effect)
import Affjax.Node (get) as AN
import Effect.Aff.Class (liftAff)
import Effect.Class.Console (log)


-- TODO fix the test after the authors close
-- https://github.com/purescript-contrib/purescript-affjax-node/issues/7
main :: Effect Unit
main = launchAff_ $ do
      resp <-  liftAff $ AN.get AXRF.document "http://0.0.0.0:1234/"
      log $ either AX.printError (\x -> x.statusText) resp

-- launchAff_ $ runSpec [consoleReporter] do
--   describe "get" do
--     it "get /" do
      -- this is for a Node app due to parcel
      -- https://github.com/purescript-contrib/purescript-affjax-node/blob/v1.0.0/src/Affjax/Node.purs#L29-L29
      -- resp1 <- 
      -- AX.request
      --       $ AX.defaultRequest
      --           { method = Left POST
      --           , url = "http://0.0.0.0:1234/"
      --           , responseFormat = AXRF.document
      --           }
      
      -- log "ok"

      -- res <- case resp of
      --   Left l -> pure $ Left $ printError l
      --   Right r -> do
      --     let nonParent = toNonElementParentNode r.body
      --     liftEffect $ getElementById "h1" nonParent >>= 
      --       (\x -> pure $ maybe (Left "no such id") (\y -> Right $ toNode y ) x)
      
      -- txt <-
      --   case res of
      --     Left l -> pure $ Left l
      --     Right r -> do
      --       txt <- liftEffect $ nodeValue r
      --       pure $ maybe (Left "no text") Right txt
      -- log $ either identity identity txt
