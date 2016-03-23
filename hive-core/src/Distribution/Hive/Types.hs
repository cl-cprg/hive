--------------------------------------------------------------------------------
-- Hive                                                                       --
-- Copyright 2016 Michael B. Gale                                             --
--------------------------------------------------------------------------------

module Distribution.Hive.Types where

--------------------------------------------------------------------------------

import Data.Aeson

import GHC.Generics

--------------------------------------------------------------------------------


data Package
    = Pkg
    deriving (Generic)

instance ToJSON Package

--------------------------------------------------------------------------------
