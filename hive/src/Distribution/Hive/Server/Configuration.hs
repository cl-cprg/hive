--------------------------------------------------------------------------------
-- Hive                                                                       --
-- Copyright 2016 Michael B. Gale                                             --
--------------------------------------------------------------------------------

module Distribution.Hive.Server.Configuration (
    HiveSrvCfg(..),
    CmdArgs(..),

    parseSrvCfg,
    parseCmdArgs
) where

--------------------------------------------------------------------------------

import GHC.Generics

import Data.Aeson
import qualified Data.ByteString.Lazy as BS

import Options.Applicative

--------------------------------------------------------------------------------

data HiveSrvCfg
    = HiveSrvCfg {
        port :: Int
    }
    deriving (Generic)

instance ToJSON HiveSrvCfg
instance FromJSON HiveSrvCfg

-- | `parseSrvCfg fp' parses the server configuration file located at `fp'.
parseSrvCfg :: FilePath -> IO (Maybe HiveSrvCfg)
parseSrvCfg fp = decode <$> BS.readFile fp

--------------------------------------------------------------------------------

-- | Command-line options of the Hive server.
data CmdArgs
    = CmdArgs {
        argCfgFile :: FilePath
    }

-- | A parser for command-line options.
cmdArgsP :: Parser CmdArgs
cmdArgsP = CmdArgs
       <$> strOption
           ( long "config"
          <> metavar "FILE"
          <> help "Name of the configuration file"
          <> value "config.json")

-- | `parseCmdArgs` parses the program's command-line options.
parseCmdArgs :: IO CmdArgs
parseCmdArgs = execParser opts
    where
        opts = info (helper <*> cmdArgsP)
            ( fullDesc
           <> progDesc "Runs the Hive server."
           <> header "hive - a package repository server")

--------------------------------------------------------------------------------
