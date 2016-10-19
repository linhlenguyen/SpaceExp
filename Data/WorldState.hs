module Data.WorldState(
WorldState(..)
)
  where
    import qualified Graphics.Gloss.Interface.Pure.Game as Gloss
    import Data.Ship

    data WorldState = WorldState {
      ws_player :: Ship,
      ws_keyPressed :: [Gloss.Key]
    }
