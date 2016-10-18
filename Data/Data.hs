module Data.Data(
Ship(..),
WorldState(..),
Action(..),
Sprite(..),
SpriteResource,
Angle,
VelocityVector
)
  where
    import qualified Graphics.Gloss.Data.Picture as Gloss
    import qualified Graphics.Gloss.Data.Point as Gloss
    import qualified Graphics.Gloss.Data.Vector as Gloss
    import qualified Graphics.Gloss.Interface.Pure.Game as Gloss
    import qualified Data.Map.Lazy as Map

    type Angle = Float -- 0 -> 360
    type SpriteResource = Map.Map Sprite Gloss.Picture
    type VelocityVector = (Float, Float) -- vx, vy

    data Action = NoAction deriving (Eq)
    data Sprite = ShipSprite | Background deriving (Eq,Ord)
    data Rotation = None | Clockwise | CounterClockwise

    data Ship = Ship {
      s_position :: Gloss.Point,
      s_direction :: Angle,
      s_accelerationVector :: VelocityVector,
      s_velocityVector :: VelocityVector,
      s_action :: Action,
      s_currentSprite :: Sprite,
      s_maxSpeed :: Float
    }

    data WorldState = WorldState {
      ws_player :: Ship,
      ws_keyPressed :: [Gloss.Key]
    }
