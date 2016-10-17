module Physics(
newVelocityVector,
radToDegree,
newPos,
velocityDecay
)
  where
    import Graphics.Gloss.Data.Point as Gloss
    import Data

    radToDegree :: Float -> Float
    radToDegree rad = rad / pi * 180

    newPos :: Gloss.Point -> VelocityVector -> Gloss.Point
    newPos (x,y) (vx,vy) = (x', y')
      where x' = x + vx
            y' = y + vy

    velocityDecay :: Float -> VelocityVector -> VelocityVector
    velocityDecay decay (vx, vy) = (vx' , vy')
      where vx' = if vx > 0 then vx - decay else vx + decay
            vy' = if vy > 0 then vy - decay else vy + decay

    newVelocityVector :: Float -> VelocityVector -> VelocityVector -> VelocityVector
    newVelocityVector maxSpeed (vx1,vy1) (vx2,vy2) = (vx, vy)
      where vx = min maxSpeed $ max (-maxSpeed) $ vx1 + vx2
            vy = min maxSpeed $ max (-maxSpeed) $ vy1 + vy2
