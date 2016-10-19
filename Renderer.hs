module Renderer(
renderCharacter,
renderGame
)
  where
    import Graphics.Gloss
    import Data.Map.Strict
    import Data.Data
    import Data.Ship
    import Data.WorldState
    import Physics

    renderCharacter :: SpriteResource -> Ship -> Picture
    renderCharacter sr ship = translate x y $ rotate degree $ bmp
      where degree = radToDegree $ -(s_direction ship)
            (x,y) = (s_position ship)
            action = s_action ship
            currentSprite = s_currentSprite ship
            spriteName = nextSprite action currentSprite
            bmp = sr!spriteName

    speedAndAccelerationVector :: Ship -> [Path]
    speedAndAccelerationVector ship = velocityPath:accelerationPath:[]
      where shipPosition@(x,y) = s_position ship
            (vx,vy) = s_velocityVector ship
            (ax,ay) = s_accelerationVector ship
            direction = s_direction ship
            velocityPath = shipPosition : (x+vx*10, y+vy*10) : []
            accelerationPath = shipPosition : (x + (10 * cos direction), y + (10 * sin direction)) : []

    renderGame :: SpriteResource -> WorldState -> Picture
    renderGame sr ws = pictures $
      --sr!Background:
      renderCharacter sr (ws_player ws)
      : (Prelude.map (color black) (Prelude.map line $ speedAndAccelerationVector (ws_player ws)))


    nextSprite :: Action -> Sprite -> Sprite
    nextSprite _ s = s
