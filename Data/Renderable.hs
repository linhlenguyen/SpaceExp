module Data.Renderable(
Renderable(..)
)
  where
    import Graphics.Gloss
    import Data.Data

    class Renderable a where
      render :: a -> SpriteResource -> Picture
