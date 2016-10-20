module Main(main)
  where
    import Graphics.Gloss
    import Graphics.Gloss.Interface.Pure.Game
    import qualified Codec.BMP as Codec
    import Setup
    import Renderer
    import Data.WorldState
    import Resources
    import Physics.Physics
    import qualified Data.Map.Lazy as Map
    import Data.Ship

    handleKey :: Key -> WorldState -> WorldState
    handleKey key ws =
      case key of
        (SpecialKey KeyLeft) -> ws { ws_player = player { s_direction = direction' - rotateSpeed } }
        (SpecialKey KeyRight) -> ws { ws_player = player { s_direction = direction' + rotateSpeed } }
        (SpecialKey KeyUp) -> ws { ws_player = player { s_accelerationVector = (vx,vy) } }
        (Char 'r') -> initialState
        _ -> ws
        where player = ws_player ws
              direction = s_direction player
              direction' = if direction > 2*pi then (direction - 2*pi) else direction
              vx = acceleration * cos direction
              vy = acceleration * sin direction

    keyUp :: Key -> WorldState -> WorldState
    keyUp key ws =
      case key of
        (SpecialKey KeyUp) -> ws { ws_player = player { s_accelerationVector = (0, 0) } }
        _ -> ws
        where player = ws_player ws

    handleKeyPress :: Event -> WorldState -> WorldState
    handleKeyPress (EventKey key Up _ _) ws = ws'
      where
        player =  ws_player ws
        ws' = resetKey key $ ws { ws_player = player { s_accelerationVector = (0, 0) } }
    handleKeyPress (EventKey key Down _ _) ws = ws'
      where
        keys = ws_keyPressed ws
        ws' = if any (\k -> k == key) keys then handleKey key ws else handleKey key $ ws { ws_keyPressed = key:keys }
    handleKeyPress _ ws = ws

    resetKey :: Key -> WorldState -> WorldState
    resetKey key ws = ws'
      where keys = ws_keyPressed ws
            player = ws_player ws
            ws' = ws { ws_keyPressed = filter (\k -> not (k == key)) keys}

    keyHold :: WorldState -> WorldState
    keyHold ws = ws'
      where keys = ws_keyPressed ws
            ws' = foldr handleKey ws keys

    accelerateShip :: WorldState -> WorldState
    accelerateShip ws = ws'
      where player = ws_player ws
            pos = s_position player
            vv = s_velocityVector player
            av = s_accelerationVector player
            vv' = velocityDecay $ newVelocityVector 120 gravityVector $ newVelocityVector (s_maxSpeed player) av vv
            pos' = newPos pos vv'
            ws' = ws { ws_player = player { s_position = pos', s_velocityVector = vv' } }

    update :: Float -> WorldState -> WorldState
    update _ = keyHold . accelerateShip

    main :: IO ()
    main = do
      resource <- loadResource
      let resourceMap = Map.fromList resource
      play window background fps initialState (renderGame resourceMap) handleKeyPress update
