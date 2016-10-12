module Renderer(
renderCharacter,
renderGame
)
  where
    import Graphics.Gloss
    import Data
    import Data.Map.Strict

    renderCharacter :: SpriteResource -> Ship -> Picture
    renderCharacter sr c = translate x y $ bmp
      where (x,y) = c_position c
            action = c_action c
            currentSprite = c_currentSprite c
            spriteName = nextSprite action currentSprite
            bmp = sr!spriteName

    renderGame :: SpriteResource -> WorldState -> Picture
    renderGame sr ws = pictures [
      --sr!Background,
      renderCharacter sr (ws_player ws)]

    nextSprite :: Action -> Sprite -> Sprite
    nextSprite _ s = s
