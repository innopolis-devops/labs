module Main where

import Prelude

import Control.Monad.Rec.Class (forever)
import Data.DateTime (DateTime, adjust)
import Data.Formatter.DateTime (FormatterCommand(..), format)
import Data.Int (toNumber)
import Data.List (fromFoldable)
import Data.Maybe (Maybe(..))
import Data.Time.Duration (Milliseconds(..)) as TD
import Effect (Effect)
import Effect.Aff as Aff
import Effect.Aff.Class (class MonadAff)
import Effect.Now (nowDateTime)
import Halogen (liftEffect)
import Halogen as H
import Halogen.Aff as HA
import Halogen.HTML as HH
import Halogen.HTML.Properties (id)
import Halogen.HTML.Properties as HP
import Halogen.Subscription as HS
import Halogen.VDom.Driver (runUI)

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
          $ H.defaultEval
              { handleAction = handleAction
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

renderTime :: DateTime -> String
renderTime = format $ fromFoldable [ Hours24, Placeholder ":", MinutesTwoDigits, Placeholder ":", SecondsTwoDigits ]

okTimeHtml :: forall (a :: Type). String -> HH.HTML a Action
okTimeHtml st = HH.div_
  [ HH.h1_ [ HH.text "Current Moscow time (UTC+3:00):" ]
  , HH.h2 [ id "time" ] [ HH.text $ st ]
  ]

noTimeHtml :: forall (a :: Type). HH.HTML a Action
noTimeHtml = HH.div_
  [ HH.h1_ [ HH.text "Current Moscow time (UTC+3:00) ... ?" ]
  ]

-- handleAction :: forall output. Action -> H.HalogenM State Action () output Aff Action
handleAction :: forall output m. MonadAff m => Action -> H.HalogenM State Action () output m Unit
handleAction = case _ of
  Init -> do
    _ <- H.subscribe =<< timer Tick
    pure unit
  Tick ->
    do
      curDateTime <- liftEffect $ nowDateTime
      let
        offsetUTCPlus3 = 3 * 60 * 60 * 1000
        curDateTime' = adjust (TD.Milliseconds $ toNumber offsetUTCPlus3) curDateTime
      H.modify_ $ (\_ -> curDateTime')

-- TODO auto-reload

type State = Maybe DateTime

data Action
  = Init
  | Tick

timer :: forall m a. MonadAff m => a -> m (HS.Emitter a)
timer val = do
  { emitter, listener } <- H.liftEffect HS.create
  _ <- H.liftAff $ Aff.forkAff $ forever do
    Aff.delay $ TD.Milliseconds 800.0
    H.liftEffect $ HS.notify listener val
  pure emitter

attr_ :: forall (a :: Row Type) (b :: Type). String -> String -> HP.IProp a b
attr_ k v = HP.attr (H.AttrName k) v

classes_
  :: forall (a :: Row Type) (b :: Type)
   . Array String
  -> HP.IProp (class :: String | a) b
classes_ n = HP.classes $ H.ClassName <$> n
