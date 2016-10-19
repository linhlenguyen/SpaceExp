module Data.StarField(
isAtBottom,
isAtTop,
isAtRight,
isAtLeft,
movementBox
)
  where
    movementBox :: (Float, Float)
    movementBox = (360,240)

    isAtBottom :: Float -> Bool
    isAtBottom y = y <= -(snd movementBox)/2

    isAtTop :: Float -> Bool
    isAtTop y = y >= (snd movementBox)/2

    isAtRight :: Float -> Bool
    isAtRight x = x >= (fst movementBox)/2

    isAtLeft :: Float -> Bool
    isAtLeft x = x <= -(fst movementBox)/2
