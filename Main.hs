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
            (px, py) = s_position player
            (bgx, bgy) = ws_backgroundPos ws
            bgPos = updateBGPosition (bgx - shiftX, bgy - shiftY)
            moon = ws_moon ws
            (mx, my) = m_position moon
            mPos = (mx - shiftX, my - shiftY)
            gradient = (py - my)/(px - mx)
            gravityVector = (px + 10, py + 10*gradient)
            (player',(shiftX,shiftY)) = accelerateShip (0,0) player
            moonDirection = m_direction moon
            ws' = ws { ws_player = player',
                       ws_backgroundPos = bgPos,
                       ws_moon = moon { m_position = mPos, m_direction = moonDirection + 0.02 },
                       ws_gravityVector = [(px,py),gravityVector]}

    update :: Float -> WorldState -> WorldState
    update _ = keyEventHandling . stepGame

    main :: IO ()
    main = do
      resource <- loadResource
      let resourceMap = Map.fromList resource
      play window background fps initialState (renderGame resourceMap) handleKeyPress update
