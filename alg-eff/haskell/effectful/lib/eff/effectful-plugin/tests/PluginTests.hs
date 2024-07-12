-- Tests copied from polysemy-plugin:
--
-- https://github.com/polysemy-research/polysemy/tree/master/polysemy-plugin/test
--
-- (c) 2019 Sandy Maguire, licensed under BSD-3-Clause
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-unused-foralls -fplugin=Effectful.Plugin #-}
module Main where

import Data.String
import Unsafe.Coerce

import Effectful
import Effectful.Dispatch.Dynamic
import Effectful.Error.Static
import Effectful.State.Static.Local

main :: IO ()
main = pure ()

----------------------------------------
-- Tests

class MPTC a b where
  mptc :: a -> b

instance MPTC Bool Int where
  mptc _ = 1000

uniquelyInt :: (State Int :> es, State String :> es) => Eff es ()
uniquelyInt = put 10

uniquelyA :: (Num a, State a :> es, State b :> es) => Eff es ()
uniquelyA = put 10

uniquelyString :: (State Int :> es, State String :> es) => Eff es ()
uniquelyString = put mempty

uniquelyB :: (MPTC Bool b, State String :> es, State b :> es) => Eff es ()
uniquelyB = put $ mptc False

uniquelyState' :: (Error () :> es, State () :> es) => Eff es ()
uniquelyState' = pure ()

idState :: State s :> es => Eff es ()
idState = do
  s <- get
  put s

intState :: State Int :> es => Eff es ()
intState = put 10

numState :: Num a => State a :> es => Eff es ()
numState = put 10

strState :: State String :> es => Eff es ()
strState = put "Hello"

oStrState :: IsString a => State a :> es => Eff es ()
oStrState = put "hello"

err :: Error e :> es => Eff es Bool
err =
  catchError
    (throwError (error ""))
    (\_ _ -> pure True)

errState :: (Num s, Error e :> es, State s :> es) => Eff es Bool
errState = do
  numState
  err

newtype MyString = MyString String
  deriving (IsString, Eq, Show)

data Janky = forall s. Janky (forall _i. Eff '[State s] ())

jankyState :: Janky
jankyState = Janky $ put True -- The plugin disambiguates effects for concrete rows too

unsafeUnjank :: Janky -> Eff '[State Bool] ()
unsafeUnjank (Janky m) = unsafeCoerce m

data MoreJanky = forall y. MoreJanky (MPTC Bool y => Eff [State (Bool, y), State (Char, y)] ())

mptcGet :: MPTC x Bool => x
mptcGet = undefined

moreJankyState :: MoreJanky
moreJankyState = MoreJanky $ put (mptcGet, True)

data TaggedState k s :: Effect where
  TaggedGet :: forall k s m. TaggedState k s m s
  TaggedPut :: forall k s m. s -> TaggedState k s m ()
type instance DispatchOf (TaggedState k s) = Dynamic

runTaggedState :: s -> Eff (TaggedState k s : es) a -> Eff es (a, s)
runTaggedState s = reinterpret (runState s) $ \_ -> \case
  TaggedGet    -> get
  TaggedPut s' -> put s'

test :: (TaggedState Char Int :> es, TaggedState Bool Int :> es) => Eff es ()
test = do
  send $ TaggedPut @Bool 10
  send $ TaggedPut @Char (-10)

newtype Select a = Select a

data DBAction whichDb :: Effect where
  DoSelect :: Select a -> DBAction whichDb m (Maybe a)
type instance DispatchOf (DBAction whichDb) = Dynamic

runDBAction :: Eff (DBAction which : es) a -> Eff es a
runDBAction = interpret $ \_ -> \case
  DoSelect (Select a) -> pure $ Just a
