module Main(main)
  where
    import Graphics.Gloss.Interface.Pure.Game
    import qualified Codec.BMP as Codec
    import Setup
    import Renderer
    import Data.WorldState
    import Resources
    import Physics.Physics
    import qualified Data.Map.Lazy as Map
    import Data.Ship
    import Controls

    processPhysics :: WorldState -> WorldState
    processPhysics ws = ws'
      where player = ws_player ws
            player' = accelerateShip player
            ws' = ws { ws_player = player' }

    update :: Float -> WorldState -> WorldState
    update _ = keyHold . processPhysics

    main :: IO ()
    main = do
      resource <- loadResource
      let resourceMap = Map.fromList resource
      play window background fps initialState (renderGame resourceMap) handleKeyPress update
