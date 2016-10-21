module Setup(
window,
background,
fps,
initialState,
rotateSpeed,
acceleration
)
  where
    import qualified Graphics.Gloss as Gloss
    import Data.WorldState
    import Data.Ship
    import Data.Data

    window :: Gloss.Display
    window = Gloss.InWindow "Window" screen (10,10)

    background :: Gloss.Color
    background = Gloss.white

    initialState :: WorldState
    initialState = WorldState {
      ws_player = newShip,
      ws_keyPressed = []
    }

    fps = 30::Int
    rotateSpeed = 0.08::Float
    acceleration = 2::Float

    screen :: (Int, Int)
    screen = (720, 480)
