module GameSetup(
window,
background,
fps,
initialState,
decayAmount,
gravityVector,
movementBox
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
      ws_keyPressed = []
    }

    fps = 30::Int

    screen :: (Int, Int)
    screen = (720, 480)

    decayAmount :: Float
    decayAmount = 0.25::Float

    gravityVector :: VelocityVector
    gravityVector = (0, 0)

    movementBox :: (Float, Float)
    movementBox = (360,240)
