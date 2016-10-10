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
    initialState = WorldState {
      ws_player = Character {
        c_position = (-100, -50),
        c_action = Stop,
        c_currentSprite = FaceRight,
        c_rotation = None
      },
      ws_keyPressed = []
    }

    fps = 60::Int
    moveSpeed = 3::Float
    acceleration = 1.5::Float
    rotateSpeed = 2::Float

    --v1 = v0 + a * t
