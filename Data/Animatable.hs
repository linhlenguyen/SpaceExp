module Animatable(

)
  where
    class Animatable a where
      nextSprite :: Sprite -> Sprite
