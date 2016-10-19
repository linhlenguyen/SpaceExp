module Data.Data(
Action(..),
Sprite(..),
SpriteResource,
VelocityVector
)
  where
    import qualified Graphics.Gloss.Data.Picture as Gloss
    import qualified Data.Map.Lazy as Map

    type SpriteResource = Map.Map Sprite Gloss.Picture
    type VelocityVector = (Float, Float) -- vx, vy

    data Rotation = None | Clockwise | CounterClockwise
    data Action = NoAction deriving (Eq)

    data Sprite = ShipSprite | Background deriving (Eq,Ord)
