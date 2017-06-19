{-# LANGUAGE OverloadedStrings #-}

module V1.Projects.Schema (Response, buildResponse) where

import Data.Aeson
import Project (Project, projectId, projectName)

newtype Response = Response Project

buildResponse :: Project -> Response
buildResponse = Response

instance ToJSON Response where
  toJSON (Response project) = object [
    "id" .= projectId project,
    "name" .= projectName project ]
