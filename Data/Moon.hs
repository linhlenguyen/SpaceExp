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
    import Data.Renderable

    moonSpriteMap :: [(SpriteTag, FilePath)]
    moonSpriteMap = [("Moon", "bmp/moon.bmp")]

    data Moon = Moon {
      m_position :: Gloss.Point,
      m_sprite :: SpriteTag,
      m_collisionPath :: CollisionPath
    }

    instance Renderable Moon where
      position moon = m_position moon
      direction moon = 0::Float
      sprite moon = m_sprite moon
      renderAdditional moon sr = [c]
        where c = color white $ translate x y $ circle radius
              (x, y) = m_position moon
              (CollisionCircle (_,_) radius) = m_collisionPath moon

    newMoon :: Moon
    newMoon = Moon {
      m_position = (0,-250),
      m_sprite = "Moon",
      m_collisionPath = CollisionCircle (0,-350) 118
    }
