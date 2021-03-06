--------------------------------------------------------------------------------
-- Hive                                                                       --
-- Copyright 2016 Michael B. Gale                                             --
--------------------------------------------------------------------------------

module Distribution.Hive.API where

--------------------------------------------------------------------------------

import Servant.API

import Distribution.Hive.Types

--------------------------------------------------------------------------------

type HiveAPI = "Package" :> PackageAPI

--------------------------------------------------------------------------------

type PackageAPI = "List" :> Get '[JSON] [Package]

--------------------------------------------------------------------------------
