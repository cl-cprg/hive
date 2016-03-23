--------------------------------------------------------------------------------
-- Hive                                                                       --
-- Copyright 2016 Michael B. Gale                                             --
--------------------------------------------------------------------------------

module Distribution.Hive.Server where

--------------------------------------------------------------------------------

import Servant

import Network.Wai
import Network.Wai.Handler.Warp

import Distribution.Hive.API
import Distribution.Hive.Server.Configuration
import Distribution.Hive.Server.Monad

--------------------------------------------------------------------------------

server :: HiveServer HiveAPI
server = return undefined

api :: Proxy HiveAPI
api = Proxy

app :: Application
app = serve api server

runHiveSrv :: HiveSrvCfg -> IO ()
runHiveSrv cfg = run (port cfg) app

--------------------------------------------------------------------------------
