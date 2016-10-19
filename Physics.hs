module Physics(
newVelocityVector,
radToDegree,
newPos,
velocityDecay,
gravityVector
)
  where
    import Graphics.Gloss.Data.Point as Gloss
    import Data.Data
    import Data.StarField

    radToDegree :: Float -> Float
    radToDegree rad = rad / pi * 180

    newPos :: Gloss.Point -> VelocityVector -> Gloss.Point
    newPos (x,y) (vx,vy) = (newX, newY)
      where (bx, by) = movementBox
            x' = x + vx
            newX = if isAtRight x' then bx/2 else if isAtLeft x' then -bx/2 else x'
            y' = y + vy
            newY = if isAtTop y' then by/2 else if isAtBottom y' then -by/2 else y'

    decayAmount :: Float
    decayAmount = 0.25::Float

    velocityDecay :: VelocityVector -> VelocityVector
    velocityDecay (vx, vy) = (vx' , vy')
      where vx' = if vx - decayAmount > 0 then vx - decayAmount else if vx + decayAmount < 0 then vx + decayAmount else 0
            vy' = if vy - decayAmount > 0 then vy - decayAmount else if vy + decayAmount < 0 then vy + decayAmount else 0

    newVelocityVector :: Float -> VelocityVector -> VelocityVector -> VelocityVector
    newVelocityVector maxSpeed (vx1,vy1) (vx2,vy2) = (vx, vy)
      where vx = min maxSpeed $ max (-maxSpeed) $ vx1 + vx2
            vy = min maxSpeed $ max (-maxSpeed) $ vy1 + vy2

    gravityVector :: VelocityVector
    gravityVector = (0, -1.5)
