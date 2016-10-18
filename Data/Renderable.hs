module Data.Renderable(
Renderable(..)
)
  where
    import Graphics.Gloss

    class Renderable a where
      render :: a -> Picture
