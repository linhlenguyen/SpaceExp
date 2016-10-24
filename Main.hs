module Main(main)
  where
    import Graphics.Gloss.Interface.Pure.Game
    import qualified Codec.BMP as Codec
    import GameSetup
    import Renderer
    import Data.WorldState
    import Resources
    import Physics.Physics
    import qualified Data.Map.Lazy as Map
    import Data.Ship
    import Controls
    import Data.StarField
    import Data.Moon

    stepGame :: WorldState -> WorldState
    stepGame ws = ws'
      where player = ws_player ws
            (player',(shiftX,shiftY)) = accelerateShip player
            (bgx, bgy) = ws_backgroundPos ws
            bgPos = updateBGPosition (bgx - shiftX, bgy - shiftY)
            moon = ws_moon ws
            (mx, my) = m_position moon
            mPos = (mx - shiftX, my - shiftY)
            ws' = ws { ws_player = player',
                       ws_backgroundPos = bgPos,
                       ws_moon = moon { m_position = mPos }}

    update :: Float -> WorldState -> WorldState
    update _ = keyHold . stepGame

    main :: IO ()
    main = do
      resource <- loadResource
      let resourceMap = Map.fromList resource
      play window background fps initialState (renderGame resourceMap) handleKeyPress update
