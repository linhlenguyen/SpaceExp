module Renderer(
renderGame
)
  where
    import Graphics.Gloss
    import Data.Data
    import Data.Ship
    import Data.WorldState
    import Data.Renderable
    import Data.StarField

    renderGame :: SpriteResource -> WorldState -> Picture
    renderGame sr ws = pictures $
      --sr!Background:
      render (ws_moon ws) sr :
      render (ws_player ws) sr :
      bgPicture (ws_backgroundPos ws) sr : []
