module Data.StarField(
isAtBottom,
isAtTop,
isAtRight,
isAtLeft,
starFieldSpriteMap,
bgPicture,
movementBox
)
  where
    import Graphics.Gloss
    import Data.Data
    import Data.Map.Strict

    starFieldSpriteMap :: [(SpriteTag, FilePath)]
    starFieldSpriteMap = [("StarField", "bmp/bg.bmp")]

    bgWidth :: Float
    bgWidth = 720

    bgHeight :: Float
    bgHeight = 480

    bgPicture :: SpriteResource -> Picture
    bgPicture sr = pictures [translate 0 0 $ screenBG sr,
      translate bgWidth (-bgHeight) $ screenBG sr,
      translate 0 (-bgHeight) $ screenBG sr,
      translate bgWidth 0 $ screenBG sr]

    screenBG :: SpriteResource -> Picture
    screenBG sr = pictures [translate (-bgWidth/2) (bgHeight/2) $ starTile sr,
      translate 0 (bgHeight/2) $ starTile sr,
      translate (-bgWidth/2) 0 $ starTile sr,
      translate 0 0 $ starTile sr]

    starTile :: SpriteResource -> Picture
    starTile sr = pictures [ color white $ rectangleWire bgWidth bgHeight,
      sr!"StarField"]

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
