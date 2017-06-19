module Main where

import Api (apiServer)
import Network.Wai.Handler.Warp (run)

main :: IO ()
main = putStrLn "Server started" >> run 8081 apiServer
