module Moon(
Moon(..)
)
  where
    import qualified Graphics.Gloss.Data.Point as Gloss
    import qualified Graphics.Gloss.Data.Picture as Gloss

    data Moon = Moon {
      m_position :: Gloss.Point,
      m_sprite :: String,
      m_collisionPath :: Path
    }

    
