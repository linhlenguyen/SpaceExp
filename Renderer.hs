module Renderer(
renderGame
)
  where
    import Graphics.Gloss
    import Data.Map.Strict
    import Data.Data
    import Data.Ship
    import Data.WorldState
    import Data.Renderable

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
      render (ws_player ws) sr
      : (Prelude.map (color black) (Prelude.map line $ speedAndAccelerationVector (ws_player ws)))

    nextSprite :: Action -> Sprite -> Sprite
    nextSprite _ s = s
