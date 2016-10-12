module Physics(
newSpeed,
newVelocityVector,
radToDegree
)
  where
    import Data

    data Quadrant = First | Second | Third | Forth

    radToDegree :: Float -> Float
    radToDegree rad = rad / pi * 360

    newSpeed :: Velocity -> Acceleration -> Time -> Velocity
    newSpeed v0 a t = v0 + a * t

    newVelocityVector :: VelocityVector -> VelocityVector -> VelocityVector
    newVelocityVector (a1,v1) (a2,v2) = (a', v')
      where v1x = v1 * cos a1
            v1y = v1 * sin a1
            v2x = v2 * cos a2
            v2y = v2 * sin a2
            vx' = v1x + v2x
            vy' = v1y + v2y
            quadrant = if vx' > 0 then if vy' > 0 then First else Forth
                       else if vy' > 0 then Second else Third
            v' = sqrt (vx'^2 + vy'^2)
            sinA' = vy' / v'
            a' = radIn2Pi quadrant $ asin sinA'

    radIn2Pi :: Quadrant -> Float -> Float
    radIn2Pi quad rad = case quad of First -> rad
                                     Second -> pi - rad
                                     Third -> pi + rad
                                     Forth -> 2*pi - rad
