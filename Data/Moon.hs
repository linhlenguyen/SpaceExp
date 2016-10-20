module Moon(
Moon(..)
)
  where
    import qualified Graphics.Gloss.Data.Point as Gloss
    import qualified Graphics.Gloss.Data.Picture as Gloss
    import Physics.Collision
    import Resources

    data Moon = Moon {
      m_position :: Gloss.Point,
      m_sprite :: SpriteTag,
      m_collisionPath :: CollisionPath
    }
