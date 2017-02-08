module Main(main)
  where
    import Graphics.Gloss.Interface.Pure.Game
    import qualified Codec.BMP as Codec
    import GameSetup
    import Renderer.Renderer
    import Data.WorldState
    import Renderer.Resources
    import Physics.Physics
    import qualified Data.Map.Lazy as Map
    import Data.Ship
    import Controls.Input
    import Controls.StepGame
    import Data.StarField
    import Data.Moon

    --Todo
    --Finish collision detection algorithm, clustering and individual objects
    --Animated sprites
    --Play animation, e.g explosion, rockets...
    --Main menu, and scoreboard...

    --Need to re-design game loop
    --Input -> Update WorldState -> Filter Visible Element -> Render Screen

    --Introduce controllable type
    --Move viewport and re-render screen accordingly
    --Refactor stepGame using non static type class or something similar

    update :: Float -> WorldState -> WorldState
    update _ = keyEventHandling . stepGame

    main :: IO ()
    main = do
      resource <- loadResource
      let resourceMap = Map.fromList resource
      play window background fps initialState (renderGame resourceMap) handleKeyPress update
