module Physics(
newVelocityVector,
radToDegree,
newPos,
velocityDecay
)
  where
    import Graphics.Gloss.Data.Point as Gloss
    import Data.Data

    radToDegree :: Float -> Float
    radToDegree rad = rad / pi * 180

    newPos :: Gloss.Point -> VelocityVector -> Gloss.Point
    newPos (x,y) (vx,vy) = (x', y')
      where x' = x + vx
            y' = y + vy

    decayAmount :: Float
    decayAmount = 0.025::Float

    velocityDecay :: VelocityVector -> VelocityVector
    velocityDecay decay (vx, vy) = (vx' , vy')
      where vx' = if vx - decayAmount > 0 then vx - decayAmount else if vx + decayAmount < 0 then vx + decayAmount else 0
            vy' = if vy - decayAmount > 0 then vy - decayAmount else if vy + decayAmount < 0 then vy + decayAmount else 0

    newVelocityVector :: Float -> VelocityVector -> VelocityVector -> VelocityVector
    newVelocityVector maxSpeed (vx1,vy1) (vx2,vy2) = (vx, vy)
      where vx = min maxSpeed $ max (-maxSpeed) $ vx1 + vx2
            vy = min maxSpeed $ max (-maxSpeed) $ vy1 + vy2

    gravityVector :: VelocityVector
    gravityVector = (0, 3)
