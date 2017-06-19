module Project
    (
      Project(..)
    , ProjectCreateParams(..)
    , createProject
    ) where

import Data.UUID
import Data.UUID.V4

type ProjectID = UUID
type ProjectName = String

data Project = Project
    { projectId :: !ProjectID
    , projectName :: !ProjectName
    }

newtype ProjectCreateParams = ProjectCreateParams ProjectName

createProject :: ProjectCreateParams -> IO Project
createProject (ProjectCreateParams name) = Project <$> nextRandom <*> pure name
