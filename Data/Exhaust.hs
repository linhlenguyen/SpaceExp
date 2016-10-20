module Data.Exhaust(
exhaustBMPMap
)
  where
    import Graphics.Gloss.Data.Point as Gloss
    import Physics.Collision
    import Resource

    data Exhaust = Exhaust {
      e_position :: Gloss.Point,
      e_currentSprite :: SpriteTag,
      e_collisionPath :: CollisionPath
    }

    spriteTagFileMap :: [(SpriteTag, FilePath)]
    spriteTagFileMap = [
      ("Fume1", "bmp/fume1.bmp"),
      ("Fume2", "bmp/fume1.bmp"),
      ("Fume3", "bmp/fume1.bmp"),
      ("Flame1", "bmp/flame1.bmp"),
      ("Flame2", "bmp/flame2.bmp"),
      ("Flame3", "bmp/flame3.bmp")
    ]

    nextSprite :: SpriteTag -> SpriteTag
    nextSprite "Fume1" = "Fume2"
    nextSprite "Fume2" = "Fume3"
    nextSprite "Fume3" = "Fume2"
