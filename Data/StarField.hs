module Data.StarField(
isAtBottom,
isAtTop,
isAtRight,
isAtLeft,
starFieldSpriteMap,
bgPicture,
movementBox,
updateBGPosition
)
  where
    import Graphics.Gloss
    import Data.Data
    import Data.Map.Strict

    starFieldSpriteMap :: [(SpriteTag, FilePath)]
    starFieldSpriteMap = [("StarField", "bmp/bg.bmp")]

    screenWidth :: Float
    screenWidth = 720

    screenHeight :: Float
    screenHeight = 480

    bgWidth :: Float
    bgWidth = screenWidth*2

    bgHeight :: Float
    bgHeight = screenHeight*2

    atTop :: Point -> Bool
    atTop (x,y) = y < -screenHeight

    atBottom :: Point -> Bool
    atBottom (x,y) = y > 0

    atLeft :: Point -> Bool
    atLeft (x,y) = x > 0

    atRight :: Point -> Bool
    atRight (x,y) = x < -screenWidth

    updateBGPosition :: Point -> Point
    updateBGPosition c@(x,y) = (x',y')
      where
        y' = if atTop c then 0 else if atBottom c then -screenHeight else y
        x' = if atRight c then 0 else if atLeft c then -screenWidth else x

    bgPicture :: Point -> SpriteResource -> Picture
    bgPicture (x,y) sr = pictures [translate x y $ screenBG sr]

    screenBG :: SpriteResource -> Picture
    screenBG sr = pictures [translate screenWidth 0 $ starTile sr,
      translate 0 screenHeight $ starTile sr,
      translate screenWidth screenHeight $ starTile sr,
      translate 0 0 $ starTile sr]

    starTile :: SpriteResource -> Picture
    starTile sr = pictures [ color white $ rectangleWire screenWidth screenHeight,
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
