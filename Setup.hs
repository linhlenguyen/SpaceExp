module Setup(
window,
background,
fps,
initialState,
rotateSpeed,
acceleration,
movementBox
)
  where
    import qualified Graphics.Gloss as Gloss
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

    newShip :: Ship
    newShip = Ship {
      s_position = (0, 0),
      s_action = NoAction,
      s_currentSprite = ShipSprite,
      s_direction = 0,
      s_accelerationVector = (0, 0),
      s_velocityVector = (0,0),
      s_maxSpeed = 6::Float
    }

    fps = 30::Int
    rotateSpeed = 0.08::Float
    acceleration = 2::Float

    screen :: (Int, Int)
    screen = (720, 480)

    movementBox :: (Float, Float)
    movementBox = (360,240)
