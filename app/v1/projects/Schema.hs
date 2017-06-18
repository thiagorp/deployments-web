{-# LANGUAGE OverloadedStrings #-}

module V1.Projects.Schema (Response, buildResponse) where

import Data.Aeson

newtype Project = Project { name :: String }
newtype Response = Response Project

buildResponse :: String -> Response
buildResponse = Response . Project

instance ToJSON Response where
  toJSON (Response project) = object [
    "name" .= name project ]
