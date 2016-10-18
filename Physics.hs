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

    velocityDecay :: Float -> VelocityVector -> VelocityVector
    velocityDecay decay (vx, vy) = (vx' , vy')
      where vx' = if vx - decay > 0 then vx - decay else if vx + decay < 0 then vx + decay else 0
            vy' = if vy - decay > 0 then vy - decay else if vy + decay < 0 then vy + decay else 0

    newVelocityVector :: Float -> VelocityVector -> VelocityVector -> VelocityVector
    newVelocityVector maxSpeed (vx1,vy1) (vx2,vy2) = (vx, vy)
      where vx = min maxSpeed $ max (-maxSpeed) $ vx1 + vx2
            vy = min maxSpeed $ max (-maxSpeed) $ vy1 + vy2
