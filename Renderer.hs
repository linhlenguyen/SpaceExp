module Renderer(
renderCharacter,
renderGame
)
  where
    import Graphics.Gloss
    import Data.Map.Strict
    import Data
    import Physics

    renderCharacter :: SpriteResource -> Ship -> Picture
    renderCharacter sr c = rotate degree $ translate x y $ bmp
      where degree = radToDegree $ s_direction c
            (x,y) = s_position c
            action = s_action c
            currentSprite = s_currentSprite c
            spriteName = nextSprite action currentSprite
            bmp = sr!spriteName

    renderGame :: SpriteResource -> WorldState -> Picture
    renderGame sr ws = pictures [
      --sr!Background,
      renderCharacter sr (ws_player ws)]

    nextSprite :: Action -> Sprite -> Sprite
    nextSprite _ s = s
