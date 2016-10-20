{-# LANGUAGE ExistentialQuantification #-}

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
    import Data.Map.Strict
    import Physics.Physics

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
      render ship sr = translate x y $ rotate degree $ bmp
        where degree = radToDegree $ -(s_direction ship)
              (x,y) = (s_position ship)
              action = s_action ship
              currentSprite = s_currentSprite ship
              spriteName = nextSprite action currentSprite
              bmp = sr!spriteName

    nextSprite :: Action -> Sprite -> Sprite
    nextSprite _ s = s
