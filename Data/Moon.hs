module Data.Moon(
Moon(..),
newMoon,
moonSpriteMap
)
  where
    import Graphics.Gloss
    import qualified Graphics.Gloss.Data.Point as Gloss
    import qualified Graphics.Gloss.Data.Picture as Gloss
    import Physics.Collision
    import Data.Data
    import TypeClasses.Renderable
    import TypeClasses.Moveable

    moonSpriteMap :: [(SpriteTag, FilePath)]
    moonSpriteMap = [("Moon", "bmp/moon.bmp")]

    data Moon = Moon {
      m_position :: Gloss.Point,
      m_sprite :: SpriteTag,
      m_collisionPath :: CollisionPath,
      m_direction :: Float,
      m_rotationSpeed :: Float
    }

    instance Renderable Moon where
      position moon = m_position moon
      direction moon = m_direction moon
      sprite moon = m_sprite moon
      {-renderAdditional moon sr = c
        where c = color white $ translate x y $ circle radius
              (x, y) = m_position moon
              (CollisionCircle (_,_) radius) = m_collisionPath moon-}

    instance Moveable Moon where
      update moon = moon'
        where direction = m_direction moon
              rotationSpeed = m_rotationSpeed moon
              moon' = moon { m_direction = direction + rotationSpeed }

    newMoon :: Moon
    newMoon = Moon {
      m_position = (0,-250),
      m_sprite = "Moon",
      m_collisionPath = CollisionCircle (0,-350) 118,
      m_direction = 0,
      m_rotationSpeed = 0.01::Float
    }
