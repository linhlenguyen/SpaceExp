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

    renderGame :: SpriteResource -> WorldState -> Picture
    renderGame sr ws = pictures $
      --sr!Background:
      render (ws_player ws) sr:[]
