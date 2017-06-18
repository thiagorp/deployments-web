{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Api (apiServer) where

import Servant
import qualified V1.Api as V1 (Api, server)

type Api = "v1" :> V1.Api

api :: Proxy Api
api = Proxy

handlers :: Server Api
handlers = V1.server

apiServer :: Application
apiServer = serve api handlers
