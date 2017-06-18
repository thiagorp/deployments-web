module Main where

import Api (apiServer)
import Network.Wai.Handler.Warp (run)

main :: IO ()
main = run 8081 apiServer
