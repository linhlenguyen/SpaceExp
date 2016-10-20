module Data.Exhaust(
exhaustBMPMap
)
  where
    import Graphics.Gloss.Data.Point as Gloss
    import Physics.Collision

    data Exhaust = Exhaust {
      e_position :: Gloss.Point,
      e_currentSprite :: ExhaustSprite,
      e_collisionPath :: CollisionPath
    }

    data ExhaustSprite = Ground1 | Ground2 | Ground3 | Air1 | Air2 | Air3 deriving (Eq)

    exhaustBMPMap :: [(ExhaustSprite, FilePath)]
    exhaustBMPMap = [
      (Ground1, "bmp/ship1.bmp") --test file path
    ]
