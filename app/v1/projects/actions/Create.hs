{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}

module V1.Projects.Actions.Create (Api, server) where

import Control.Monad.IO.Class

import Data.Aeson
import Servant

import Lib (ProjectCreateParams(..), createProject)
import V1.Projects.Schema (Response, buildResponse)

type Api = ReqBody '[JSON] Body :> Post '[JSON] Response

newtype Body = Body
  { projectName :: String }

instance FromJSON Body where
  parseJSON = withObject "project" parse'
    where
      parse' o = Body <$> o .: "name"

create :: Body -> Handler Response
create body = liftIO $ buildResponse <$> create' body
    where
      create' = createProject . buildParams
      buildParams = ProjectCreateParams . projectName

server :: Server Api
server = create
