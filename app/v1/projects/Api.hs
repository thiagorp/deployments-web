{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}

module V1.Projects.Api (Api, server) where

import Data.Aeson
import Servant
import qualified V1.Projects.Actions.Create as Create (Api, server)

type Api = Create.Api

server :: Server Api
server = Create.server
