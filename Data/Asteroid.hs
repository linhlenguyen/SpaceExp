module Asteroid(
Asteroid(..)
)
  where
    import qualified Graphics.Gloss.Data.Point as Gloss
    import qualified Graphics.Gloss.Data.Picture as Gloss
    import Data.Data
    import Physics.Collision

    data Asteroid = Asteroid {
      a_position :: Gloss.Point,
      a_velocityVector :: VelocityVector,
      a_sprite :: String
      a_collisionPath :: CollisionPath
    }
