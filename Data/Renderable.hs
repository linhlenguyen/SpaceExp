module Data.Renderable(
Renderable(..)
)
  where
    import Graphics.Gloss

    type ResourceTag = String
    type ResourceMapper = [(ResourceTag, Picture)]

    class Renderable a where
      render :: a -> ResourceMapper -> Picture
