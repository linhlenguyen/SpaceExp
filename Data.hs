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
    import qualified Graphics.Gloss.Data.Vector as Gloss
    import qualified Graphics.Gloss.Interface.Pure.Game as Gloss
    import qualified Data.Map.Lazy as Map

    type Time = Float
    type Acceleration = Float
    type Velocity = Float
    type Angle = Float -- 0 -> 360
    type SpriteResource = Map.Map Sprite Gloss.Picture
    type VelocityVector = (Angle, Velocity)

    data Action = None deriving (Eq)
    data Sprite = Ship | Background deriving (Eq,Ord)
    data Rotation = None | Clockwise | CounterClockwise

    data Ship = Ship {
      s_position :: Gloss.Point,
      s_speed :: Velocity,
      s_acceleration :: Acceleration,
      s_accelerationTime :: Time,
      s_direction :: Angle,
      s_action :: Action,
      s_currentSprite :: Sprite
    }

    data WorldState = WorldState {
      ws_playerShip :: Ship,
      ws_keyPressed :: [Gloss.Key]
    }
