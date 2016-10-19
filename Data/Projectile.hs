module Data.Projectile(
Projectile(..)
)
  where
    import qualified Graphics.Gloss.Data.Point as Gloss
    import qualified Graphics.Gloss.Data.Path as Gloss
    import Data.Data

    data Projectile = Projectile {
      p_position :: Gloss.Point,
      p_velocityVector :: VelocityVector,
      p_sprite :: Sprite,
      p_collisionPath :: Path
    }
