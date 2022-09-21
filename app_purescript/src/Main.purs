module Main where

import Prelude

import Control.Monad.Rec.Class (forever)
import Data.Array (intercalate)
import Data.DateTime (Time, hour, minute, second)
import Data.Enum (fromEnum)
import Data.Maybe (Maybe(..))
import Data.Time.Duration (Milliseconds(..))
import Effect (Effect)
import Effect.Aff as Aff
import Effect.Aff.Class (class MonadAff)
import Effect.Now (nowTime)
import Halogen (liftEffect)
import Halogen as H
import Halogen.Aff as HA
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.Subscription as HS
import Halogen.VDom.Driver (runUI)

-- HTML starts here

main :: Effect Unit
main = do
    HA.runHalogenAff do
      body <- HA.awaitBody
      runUI component unit body
  
-- #Component
component :: forall query input output m. MonadAff m => H.Component query input output m
component =
  H.mkComponent
    { initialState
    , render
    , eval:
        H.mkEval
          $ H.defaultEval {
            handleAction = handleAction
          , initialize = Just Init
          }
    }
  where
    initialState _ = Nothing

render :: forall m. State -> H.ComponentHTML Action () m
render = 
  case _ of
    Just curTime -> okTimeHtml $ renderTime curTime
    Nothing -> noTimeHtml
  -- HH.text ("You have been here for " <> show seconds <> " seconds")

renderTime :: Time -> String
renderTime curTime = intercalate ":" $ show <$> [h, m, s]
  where
    h = fromEnum $ hour curTime :: Int
    m = fromEnum $ minute curTime :: Int
    s = fromEnum $ second curTime :: Int

okTimeHtml :: forall (a :: Type). String -> HH.HTML a Action
okTimeHtml st = HH.div_
    [ HH.h1_ [ HH.text "Current Moscow time (UTC+3:00):" ]
    , HH.h2_ [ HH.text $ st ]
    ]

noTimeHtml :: forall (a :: Type). HH.HTML a Action
noTimeHtml = HH.div_
    [ HH.h1_ [ HH.text "Current Moscow time (UTC+3:00) ..." ]
    ]

-- handleAction :: forall output. Action -> H.HalogenM State Action () output Aff Action
handleAction :: forall output m. MonadAff m => Action -> H.HalogenM State Action () output m Unit
handleAction = case _ of
    Init -> do 
      _ <- H.subscribe =<< timer Tick
      pure unit
    Tick -> 
      do
        curTime <- liftEffect $ nowTime
        H.modify_ $ (\_ -> Just curTime)
      
-- TODO auto-reload

type State = Maybe Time

data Action = 
    Init
  | Tick

timer :: forall m a. MonadAff m => a -> m (HS.Emitter a)
timer val = do
  { emitter, listener } <- H.liftEffect HS.create
  _ <- H.liftAff $ Aff.forkAff $ forever do
    Aff.delay $ Milliseconds 800.0
    H.liftEffect $ HS.notify listener val
  pure emitter


attr_ :: forall (a :: Row Type) (b :: Type). String -> String -> HP.IProp a b
attr_ k v = HP.attr (H.AttrName k) v

classes_
  :: forall (a :: Row Type) (b :: Type)
   . Array String
  -> HP.IProp (class :: String | a) b
classes_ n = HP.classes $ H.ClassName <$> n
