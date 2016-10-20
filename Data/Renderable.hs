module Data.Renderable(
Renderable(..)
)
  where
    import Graphics.Gloss
    import Data.Data
    import Physics.Physics
    import Data.Map.Strict

    --Potition, direction and sprite is going to have the same or similar implementation for all instances.
    --Should be simplified
    class Renderable a where
      position :: a -> Point
      direction :: a -> Float
      sprite :: a -> Sprite
      render :: a -> SpriteResource -> Picture
      render a sr = translate x y $ rotate degree $ bmp
        where degree = radToDegree $ -(direction a)
              (x,y) = (position a)
              spriteTag = sprite a
              bmp = sr!spriteTag
