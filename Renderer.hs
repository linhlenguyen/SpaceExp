module Renderer(
renderGame
)
  where
    import Graphics.Gloss
    import Data.Data
    import Data.Ship
    import Data.Moon
    import Data.WorldState
    import Data.Renderable
    import Data.StarField

    renderGame :: SpriteResource -> WorldState -> Picture
    renderGame sr ws = pictures $
      --sr!Background:
      (color white $ line $ ws_gravityVector ws) :
      render (ws_moon ws) sr :
      render (ws_player ws) sr :
      bgPicture (ws_backgroundPos ws) sr : []
