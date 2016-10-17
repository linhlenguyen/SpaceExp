module Setup(
window,
background,
fps,
initialState,
rotateSpeed,
acceleration,
decayAmount
)
  where
    import qualified Graphics.Gloss as Gloss
    import Data

    window :: Gloss.Display
    window = Gloss.InWindow "Window" (720,480) (10,10)

    background :: Gloss.Color
    background = Gloss.white

    initialState :: WorldState
    initialState = WorldState {
      ws_player = Ship {
        s_position = (0, 0),
        s_action = NoAction,
        s_currentSprite = ShipSprite,
        s_direction = 0,
        s_accelerationVector = (0, 0),
        s_velocityVector = (0,0),
        s_maxSpeed = 3::Float
      },
      ws_keyPressed = []
    }

    fps = 30::Int
    rotateSpeed = 0.05::Float
    acceleration = 0.5::Float
    decayAmount = 0::Float

    --v1 = v0 + a * t
