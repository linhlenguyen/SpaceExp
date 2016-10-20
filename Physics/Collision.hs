--Uses SAT collision detection algorithm
module Physics.Collision(
CollisionPath(..),
Collidable(..)
)
  where
    import qualified Graphics.Gloss.Data.Point as Gloss
    import qualified Graphics.Gloss.Data.Picture as Gloss

    type Radius = Float

    data CollisionPath = Circle Gloss.Point Radius | Polygon Gloss.Path

    class Collidable c where
      detectCollision :: c -> c -> Bool

    instance Collidable CollisionPath where
      detectCollision (Circle (x,y) r) (Polygon (p:ps)) = undefined
      detectCollision p@(Polygon _) c@(Circle _ _) = detectCollision c p
      detectCollision (Polygon (p1:ps1)) (Polygon (p2:ps2)) = undefined

    --project a Point onto an axis defined by 2 points and returns its value
    projectTo :: Gloss.Point -> (Gloss.Point, Gloss.Point) -> Float
    projectTo (x, y) ((p1x,p1y), (p2x,p2y)) = undefined

    isConvex :: Gloss.Path -> Bool
    isConvex (x:xs) = undefined

    convexDecomposition :: Gloss.Path -> [Gloss.Path]
    convexDecomposition (x:xs) = undefined
