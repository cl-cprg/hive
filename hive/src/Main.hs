--------------------------------------------------------------------------------
-- Hive                                                                       --
-- Copyright 2016 Michael B. Gale                                             --
--------------------------------------------------------------------------------

module Main (main) where

--------------------------------------------------------------------------------

import Distribution.Hive.Server
import Distribution.Hive.Server.Configuration

--------------------------------------------------------------------------------

-- | `main' is the main entry point for this application.
main :: IO ()
main = do
    -- parse the command-line arguments
    args <- parseCmdArgs

    -- parse the server configuration
    mcfg <- parseSrvCfg (argCfgFile args)

    case mcfg of
        Nothing  -> putStrLn "Unable to parse the configuration file."
        Just cfg -> -- run the server
            runHiveSrv cfg

--------------------------------------------------------------------------------
