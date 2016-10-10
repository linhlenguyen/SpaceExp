module Data(
Character(..),
WorldState(..),
Action(..),
Sprite(..),
SpriteResource
)
  where
    import qualified Graphics.Gloss.Data.Picture as Gloss
    import qualified Graphics.Gloss.Data.Point as Gloss
    import qualified Graphics.Gloss.Interface.Pure.Game as Gloss
    import qualified Data.Map.Lazy as Map

    type SpriteResource = Map.Map Sprite Gloss.Picture

    data Action = Stop | MoveLeft | MoveRight | MoveUp | MoveDown deriving (Eq)
    data Sprite = Ship | Background deriving (Eq,Ord)
    data Rotation = None | Clockwise | CounterClockwise

    data Ship = Ship {
      s_position :: Gloss.Point,
      s_speed :: Speed
      s_action :: Action,
      s_currentSprite :: Sprite
    }

    data WorldState = WorldState {
      ws_playerShip :: Ship,
      ws_keyPressed :: [Gloss.Key]
    }
