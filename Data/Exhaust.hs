module Data.Exhaust(
exhaustBMPMap
)
  where
    data ExhaustSprite = Ground1 | Ground2 | Ground3 | Air1 | Air2 | Air3 deriving (Eq)

    exhaustBMPMap :: [(ExhaustSprite, FilePath)]
    exhaustBMPMap = [
      (Ground1, "bmp/ship1.bmp") --test file path
    ]
