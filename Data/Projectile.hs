module Data.Projectile(
Projectile(..)
)
  where
    import qualified Graphics.Gloss.Data.Point as Gloss
    import Data

    data Projectile = Projectile {
      p_position :: Gloss.Point,
      p_velocityVector :: VelocityVector,
      p_sprite :: Sprite
    }
