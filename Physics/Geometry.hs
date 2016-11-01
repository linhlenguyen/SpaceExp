module Physics.Geometry(
intersectPoint,
distAtoCLine
)
  where
    aToBGradient :: (Floating a) => (a, a) -> (a, a) -> a
    aToBGradient (a, b) (c, d) = gradient
      where
        dx = c - a
        dy = d - b
        gradient = dy / dx

    lineEqn :: (Floating a) => (a, a) -> a -> (a, a) --rtn (m,c) in y = mx + c
    lineEqn (a, b) c = (c,yIntersect)
      where yIntersect = b - c * a

    intersectPoint :: (Floating a) => (a, a) -> (a, a) -> (a, a) -> (a, a) -- point at which line through c intersects line ab
    intersectPoint (a, b) (c, d) (e, f) = (x,y)
      where
        abGrad = aToBGradient (a,b) (c,d)
        abLine = lineEqn (a,b) abGrad
        cLine = lineEqn (e,f) (-1 / abGrad)
        xs = fst abLine - fst cLine
        eqnConst = snd cLine - snd abLine
        x = eqnConst / xs
        y = abGrad * x + snd abLine

    distAtoCLine :: (Floating a) => (a, a) -> (a, a) -> (a, a) -> a
    distAtoCLine (a, b) (c, d) (e, f) = sqrt $ (sideA ^ 2) + (sideB ^ 2)
      where
        pointD = intersectPoint (a,b) (c,d) (e,f)
        sideA = fst pointD - a
        sideB = snd pointD - b
