module Physics.Physics(
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

    newPos :: Gloss.Point -> VelocityVector -> (Gloss.Point, Bool)
    newPos (x,y) (vx,vy) = ((newX, newY),bounded)
      where (bx, by) = movementBox
            x' = x + vx
            (newX,boundedX) = if isAtRight x' then (bx/2,True) else if isAtLeft x' then (-bx/2,True) else (x',False)
            y' = y + vy
            (newY,boundedY) = if isAtTop y' then (by/2,True) else if isAtBottom y' then (-by/2,True) else (y',False)
            bounded = boundedX || boundedY

    decayAmount :: Float
    decayAmount = 0::Float

    gravityVector :: VelocityVector
    gravityVector = (0, 0)

    velocityDecay :: VelocityVector -> VelocityVector
    velocityDecay (vx, vy) = (vx' , vy')
      where vx' = if vx - decayAmount > 0 then vx - decayAmount else if vx + decayAmount < 0 then vx + decayAmount else 0
            vy' = if vy - decayAmount > 0 then vy - decayAmount else if vy + decayAmount < 0 then vy + decayAmount else 0

    newVelocityVector :: Float -> VelocityVector -> VelocityVector -> VelocityVector
    newVelocityVector maxSpeed (vx1,vy1) (vx2,vy2) = (vx, vy)
      where vx = min maxSpeed $ max (-maxSpeed) $ vx1 + vx2
            vy = min maxSpeed $ max (-maxSpeed) $ vy1 + vy2
