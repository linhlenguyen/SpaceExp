module Data.WorldState(
WorldState(..)
)
  where
    import qualified Graphics.Gloss.Data.Point as Gloss
    import qualified Graphics.Gloss.Interface.Pure.Game as Gloss
    import Data.Ship
    import Data.Moon

    data WorldState = WorldState {
      ws_player :: Ship,
      ws_moon :: Moon,
      ws_backgroundPos :: Gloss.Point,
      ws_keyPressed :: [Gloss.Key]
    }
