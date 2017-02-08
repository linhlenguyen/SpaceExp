module Controls.StepGame(
stepGame
)
  where
    import Data.Ship
    import Data.Moon
    import Data.StarField
    import Data.WorldState

    stepGame :: WorldState -> WorldState
    stepGame ws = ws'
      where player = ws_player ws
            (px, py) = s_position player
            (bgx, bgy) = ws_backgroundPos ws
            bgPos = updateBGPosition (bgx - shiftX, bgy - shiftY)
            moon = ws_moon ws
            (mx, my) = m_position moon
            mPos = (mx - shiftX, my - shiftY)
            (gx, gy) = ((mx - px),(my - py))
            distanceFromMoon = sqrt ((mx - px)^2 + (my-py)^2)
            gravity = (px + gx* (min 0.1 (100/distanceFromMoon)), py + gy*(min 0.1 (100/distanceFromMoon)))
            (player',(shiftX,shiftY)) = accelerateShip (0,0) player
            moonDirection = m_direction moon
            ws' = ws { ws_player = player',
                       ws_backgroundPos = bgPos,
                       ws_moon = moon { m_position = mPos, m_direction = moonDirection + m_rotationSpeed moon },
                       ws_gravityVector = [(px,py),gravity]}
