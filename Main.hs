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

    --Need to re-design game loop
    --Input -> Update WorldState -> Filter Visible Element -> Render Screen

    --Introduce controllable type
    --Move viewport and re-render screen accordingly
    --Refactor stepGame using non static type class or something similar

    stepGame :: WorldState -> WorldState
    stepGame ws = ws'
      where player = ws_player ws
            (px, py) = s_position player
            (bgx, bgy) = ws_backgroundPos ws
            bgPos = updateBGPosition (bgx - shiftX, bgy - shiftY)
            moon = ws_moon ws
            (mx, my) = m_position moon
            mPos = (mx - shiftX, my - shiftY)
            (gx, gy) = ((mx - px),(my - py))
            distanceFromMoon = sqrt ((mx - px)^2 + (my-py)^2)
            gravity = (px + gx* (min 0.1 (100/distanceFromMoon)), py + gy*(min 0.1 (100/distanceFromMoon)))
            (player',(shiftX,shiftY)) = accelerateShip (0,0) player
            moonDirection = m_direction moon
            ws' = ws { ws_player = player',
                       ws_backgroundPos = bgPos,
                       ws_moon = moon { m_position = mPos, m_direction = moonDirection + m_rotationSpeed moon },
                       ws_gravityVector = [(px,py),gravity]}

    update :: Float -> WorldState -> WorldState
    update _ = keyEventHandling . stepGame

    main :: IO ()
    main = do
      resource <- loadResource
      let resourceMap = Map.fromList resource
      play window background fps initialState (renderGame resourceMap) handleKeyPress update
