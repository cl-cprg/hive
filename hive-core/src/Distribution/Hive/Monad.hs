--------------------------------------------------------------------------------
-- Hive                                                                       --
-- Copyright 2016 Michael B. Gale                                             --
--------------------------------------------------------------------------------

module Distribution.Hive.Monad where

--------------------------------------------------------------------------------

import Database.Persist
import Database.Persist.Sql

--import Control.Monad.Trans.Control

--------------------------------------------------------------------------------

type HiveT m = SqlPersistT m

-- | `runHiveT m' runs a computation `m'.
runHiveT ::
    {- (MonadBaseControl IO m, MonadIO m, MonadLogger m) => -}
    HiveT m a -> SqlPersistT m a
runHiveT = undefined

--------------------------------------------------------------------------------
