{-# LANGUAGE RankNTypes #-}

module DeployAppConfig where

import Control.Monad.IO.Class (MonadIO)
import Control.Monad.Trans.Except (ExceptT)
import Control.Monad.Trans.Reader (ReaderT, runReaderT)
import GHC.Generics (Generic)

newtype AppConfig = AppConfig
  { getAppName :: String }

data AppError = EntityNotFound | ValidationError [String]

type AppHandler = ReaderT AppConfig (ExceptT AppError IO)

runAppHandler :: forall a. AppHandler a -> AppConfig -> ExceptT AppError IO a
runAppHandler = runReaderT
