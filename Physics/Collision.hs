--Uses SAT collision detection algorithm
module Physics.Collision(
CollisionPath(..),
Collidable(..)
)
  where
    import qualified Graphics.Gloss.Data.Point as Gloss
    import qualified Graphics.Gloss.Data.Picture as Gloss
    import Physics.Geometry

    type Radius = Float

    data CollisionPath = CollisionCircle Gloss.Point Radius | CollisionPolygon Gloss.Path

    class Collidable c where
      detectCollision :: c -> c -> Bool

    instance Collidable CollisionPath where
      detectCollision circle@(CollisionCircle (x,y) r) polygon@(CollisionPolygon (p:ps)) = circlePolygonCollision circle polygon
      detectCollision p@(CollisionPolygon _) c@(CollisionCircle _ _) = detectCollision c p
      detectCollision (CollisionPolygon (p1:ps1)) (CollisionPolygon (p2:ps2)) = undefined

    circlePolygonCollision :: CollisionPath -> CollisionPath -> Bool
    circlePolygonCollision (CollisionCircle (x,y) r) (CollisionPolygon (p:ps)) = collision
      where
        collision = False

    polygonsCollison :: CollisionPath -> CollisionPath -> Bool
    polygonsCollison polygon1@(CollisionPolygon (p1:ps1)) polygon2@(CollisionPolygon (p2:ps2)) = undefined

    minMax :: (Ord a) => [a] -> (a,a)
    minMax [x] = (x,x)
    minMax (x:xs) = minMax' (x,x) xs

    minMax' :: (Ord a) => (a,a) -> [a] -> (a,a)
    minMax' (smallest, largest) (x:xs) = minMax' (smallest', largest') xs
      where smallest' = if x < smallest then x else smallest
            largest' = if x > largest then x else largest

    hasOverlap :: [Float] -> [Float] -> Bool
    hasOverlap xs ys = overlap
      where (minA, maxA) = minMax xs
            (minB, maxB) = minMax ys
            overlap = minA > maxB || maxA < minB

    --project a Point onto an axis defined by 2 points and returns its x coordinates
    projectTo :: Gloss.Point -> (Gloss.Point, Gloss.Point) -> Float
    projectTo c (a,b) = fst $ intersectPoint a b c

    isConvex :: Gloss.Path -> Bool
    isConvex (x:xs) = undefined

    convexDecomposition :: Gloss.Path -> [Gloss.Path]
    convexDecomposition (x:xs) = undefined
