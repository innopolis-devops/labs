module Main where

import           Config
import           WebApp (runWebApp)

main :: IO ()
main = do
  config <- readConfig
  runWebApp config
