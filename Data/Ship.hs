module Data.Ship(
Ship(..)
)
  where
    import Graphics.Gloss
    import qualified Graphics.Gloss.Data.Point as Gloss
    import qualified Graphics.Gloss.Data.Picture as Gloss
    import Data.Data
    import Physics.Collision
    import Data.Renderable

    data Ship = Ship {
      s_position :: Gloss.Point,
      s_direction :: Float, -- 0 -> 360
      s_accelerationVector :: VelocityVector,
      s_velocityVector :: VelocityVector,
      s_action :: Action,
      s_currentSprite :: Sprite,
      s_maxSpeed :: Float,
      s_collisionPath :: Gloss.Path
    }

    instance Renderable Ship where
      position ship = s_position ship
      direction ship = s_direction ship
      sprite ship = nextSprite (s_action ship) $ s_currentSprite ship

    nextSprite :: Action -> Sprite -> Sprite
    nextSprite _ s = s
