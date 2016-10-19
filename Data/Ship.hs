{-# LANGUAGE ExistentialQuantification #-}

module Data.Ship(
Ship(..)
)
  where
    import qualified Graphics.Gloss.Data.Point as Gloss
    import qualified Graphics.Gloss.Data.Picture as Gloss
    import Data.Data
    import Data.Renderable

    type Angle = Float -- 0 -> 360

    data Ship = Ship {
      s_position :: Gloss.Point,
      s_direction :: Angle,
      s_accelerationVector :: VelocityVector,
      s_velocityVector :: VelocityVector,
      s_action :: Action,
      s_currentSprite :: Sprite,
      s_maxSpeed :: Float,
      s_collisionPath :: Gloss.Path
    }

    instance Renderable Ship where
      render a b = undefined

    data WorldObject = forall a. (Renderable a) => WorldObject a
