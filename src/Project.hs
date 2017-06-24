module Project
    (
      Project(..)
    , ProjectCreateParams(..)
    , createProject
    ) where

import Data.UUID
import Data.UUID.V4
import Control.Monad.IO.Class (liftIO)
import Control.Monad.Trans.Reader (asks)

import DeployAppConfig (AppHandler(..), getAppName)

type ProjectID = UUID
type ProjectName = String

data Project = Project
    { projectId :: !ProjectID
    , projectName :: !ProjectName
    }

newtype ProjectCreateParams = ProjectCreateParams ProjectName

createProject :: ProjectCreateParams -> AppHandler Project
createProject (ProjectCreateParams name) = do
  appName <- asks getAppName
  uuid <- liftIO nextRandom
  return $ Project uuid appName
