module Setup(
window,
background,
fps,
moveSpeed,
initialState
)
  where
    import qualified Graphics.Gloss as Gloss
    import Data

    window :: Gloss.Display
    window = Gloss.InWindow "Window" (720,480) (10,10)

    background :: Gloss.Color
    background = Gloss.white

    initialState :: WorldState
    initialState = Ship {
      ws_player = Ship {
        s_position = (0, 0),
        s_speed = 0,
        s_acceleration = 1.5::Float,
        s_accelerationTime = 0
        s_direction = pi/2,
        s_action = None,
        s_currentSprite = Ship,
      },
      ws_keyPressed = []
    }

    fps = 60::Int
    rotateSpeed = 0.2::Float
    maxSpeed = 255::Float

    --v1 = v0 + a * t
