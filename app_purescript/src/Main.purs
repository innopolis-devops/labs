module Main where

import Prelude

import Data.DateTime (Time)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Aff (Aff) as EA
import Halogen as H
import Halogen.Aff as HA
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.VDom.Driver (runUI)

-- HTML starts here

main :: Effect Unit
main = do
    HA.runHalogenAff do
      body <- HA.awaitBody
      runUI component unit body
  
-- #Component
component :: ∀ a b c. H.Component a b c EA.Aff
component =
  H.mkComponent
    { initialState
    , render
    , eval:
        H.mkEval
          $ H.defaultEval {
            handleAction = handleAction
          , initialize = Nothing
          }
    }
  where
    initialState _ = Nothing
    render = html
  
  handleAction :: forall output. Action -> H.HalogenM State Action () output Aff Unit
  handleAction ac = do
    case ac of
      Init -> do

-- TODO auto-reload

type State = Maybe Time



html :: forall (a :: Type). State -> HH.HTML a Unit
html st = HH.div_
    [ HH.h1_ [ HH.text "Current Moscow time (UTC+3:00)" ]
    , HH.h3_ [ HH.text $ show st ]
    ]

-- End of HTML

attr_ :: forall (a :: Row Type) (b :: Type). String -> String -> HP.IProp a b
attr_ k v = HP.attr (H.AttrName k) v

classes_
  :: forall (a :: Row Type) (b :: Type)
   . Array String
  -> HP.IProp (class :: String | a) b
classes_ n = HP.classes $ H.ClassName <$> n
