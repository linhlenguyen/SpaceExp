module Data.Data(
SpriteTag,
SpriteResource,
VelocityVector
)
  where
    import qualified Graphics.Gloss.Data.Picture as Gloss
    import qualified Data.Map.Lazy as Map

    type SpriteTag = String
    type SpriteResource = Map.Map SpriteTag Gloss.Picture
    type VelocityVector = (Float, Float) -- vx, vy
