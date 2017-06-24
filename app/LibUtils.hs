{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE TypeOperators #-}

module LibUtils (libToServant) where

import Control.Monad.Trans.Except (ExceptT, withExceptT)
import Servant

import DeployAppConfig

mapAppError :: AppError -> ServantErr
mapAppError _ = err500

mapErrors :: ExceptT AppError IO a -> ExceptT ServantErr IO a
mapErrors = withExceptT mapAppError

runWithConfig :: AppHandler a -> ExceptT AppError IO a
runWithConfig handler = runAppHandler handler $ AppConfig "Test App"

libToServant' :: forall a. AppHandler a -> Handler a
libToServant' handler = Handler $ (mapErrors . runWithConfig) handler

libToServant :: AppHandler :~> Handler
libToServant = NT libToServant'
