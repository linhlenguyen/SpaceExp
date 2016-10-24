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

    stepGame :: WorldState -> WorldState
    stepGame ws = ws'
      where player = ws_player ws
            (player',(shiftX,shiftY)) = accelerateShip player
            (bgx, bgy) = ws_backgroundPos ws
            bgPos' = (bgx - shiftX, bgy - shiftY)
            bgPos'' = updateBGPosition bgPos'
            ws' = ws { ws_player = player',
                       ws_backgroundPos = bgPos''}

    update :: Float -> WorldState -> WorldState
    update _ = keyHold . stepGame

    main :: IO ()
    main = do
      resource <- loadResource
      let resourceMap = Map.fromList resource
      play window background fps initialState (renderGame resourceMap) handleKeyPress update
