module Setup(
window,
background,
fps,
initialState,
rotateSpeed,
maxSpeed,
acceleration
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
        s_speed = 0::Float,
        s_acceleration = 0::Float,
        s_accelerationTime = 0::Float,
        s_direction = 4*pi/3,
        s_action = NoAction,
        s_currentSprite = ShipSprite
      },
      ws_keyPressed = []
    }

    fps = 30::Int
    rotateSpeed = 0.05::Float
    acceleration = 1.5::Float
    maxSpeed = 255::Float

    --v1 = v0 + a * t
