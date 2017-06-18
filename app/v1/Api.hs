{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module V1.Api (Api, server) where

import Servant
import qualified V1.Projects.Api as Projects (Api, server)

type Api = "projects" :> Projects.Api

server :: Server Api
server = Projects.server
