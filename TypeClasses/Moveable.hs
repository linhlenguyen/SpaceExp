module TypeClasses.Moveable(
Moveable(..)
)
  where
    class Moveable a where
      update :: a -> a
      update a = a
