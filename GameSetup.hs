module GameSetup(
window,
background,
fps,
initialState
)
  where
    import qualified Graphics.Gloss as Gloss
    import Data.WorldState
    import Data.Ship
    import Data.Moon
    import Data.Data

    window :: Gloss.Display
    window = Gloss.InWindow "Window" screen (10,10)

    background :: Gloss.Color
    background = Gloss.black

    initialState :: WorldState
    initialState = WorldState {
      ws_player = newShip,
      ws_moon = newMoon,
      ws_backgroundPos = (0,0),
      ws_keyPressed = []
    }

    fps = 30::Int

    screen :: (Int, Int)
    screen = (720, 480)
