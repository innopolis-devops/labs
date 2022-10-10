{-# LANGUAGE OverloadedStrings #-}

module Lib where

import Web.Scotty

import Data.Monoid (mconcat)

server = scotty 3000 $
  get "/:word" $ do
    beam <- param "word"
    html $ mconcat ["<h1>Scotty, ", beam, " me up!</h1>"]