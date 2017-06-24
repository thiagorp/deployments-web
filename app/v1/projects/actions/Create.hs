{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}

module V1.Projects.Actions.Create (Api, server) where

import Data.Aeson
import Servant

import Project (ProjectCreateParams(ProjectCreateParams), createProject)
import LibUtils (libToServant)
import V1.Projects.Schema (Response, buildResponse)
import DeployAppConfig (AppHandler)

type Api = ReqBody '[JSON] Body :> Post '[JSON] Response

newtype Body = Body
  { projectName :: String }

instance FromJSON Body where
  parseJSON = withObject "project" parse'
    where
      parse' o = Body <$> o .: "name"

create :: Body -> AppHandler Response
create body = buildResponse <$> create' body
    where
      create' = createProject . buildParams
      buildParams = ProjectCreateParams . projectName

server :: Server Api
server = enter libToServant create
