module Main(main)
  where
    import Graphics.Gloss
    import Graphics.Gloss.Interface.Pure.Game
    import qualified Codec.BMP as Codec
    import Setup
    import Renderer
    import Data
    import Resources
    import qualified Data.Map.Lazy as Map

    handleKey :: Key -> WorldState -> WorldState
    handleKey key ws =
      case key of
        (SpecialKey KeyLeft) -> ws { ws_player = player { s_direction = direction + rotateSpeed } }
        (SpecialKey KeyRight) -> ws { ws_player = player { s_direction = direction - rotateSpeed } }
        (SpecialKey KeyUp) -> ws { ws_player = player { s_acceleration = acceleration } }
        _ -> ws
        where player = ws_player ws
              direction = s_direction $ player

    handleKeyPress :: Event -> WorldState -> WorldState
    handleKeyPress (EventKey key Up _ _) ws = ws'
      where
        ws' = resetKey key $ ws { ws_player = player { s_acceleration = 0 } }
    handleKeyPress (EventKey key Down _ _) ws = ws'
      where
        keys = ws_keyPressed ws
        ws' = if any (\k -> k == key) keys then handleKey key ws else handleKey key $ ws { ws_keyPressed = key:keys }
    handleKeyPress _ ws = ws

    resetKey :: Key -> WorldState -> WorldState
    resetKey key ws = ws'
      where keys = ws_keyPressed ws
            player = ws_player ws
            ws' = ws { ws_keyPressed = filter (\k -> not (k == key)) keys,
                       ws_player = player {s_action = NoAction} }

    keyHold :: WorldState -> WorldState
    keyHold ws = ws'
      where keys = ws_keyPressed ws
            ws' = foldr handleKey ws keys

    accelerateShip :: WorldState -> WorldState
    accelerateShip ws = ws'
      where player = ws_player ws
            speed = s_speed player
            ws' = ws

    update :: Float -> WorldState -> WorldState
    update _ = keyHold . accelerateShip

    main :: IO ()
    main = do
      resource <- loadResource
      let resourceMap = Map.fromList resource
      play window background fps initialState (renderGame resourceMap) handleKeyPress update
