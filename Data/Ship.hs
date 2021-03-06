module Data.Ship(
Ship(..),
shipSpriteMap,
newShip,
accelerateShip
)
  where
    import Graphics.Gloss
    import qualified Graphics.Gloss.Data.Point as Gloss
    import qualified Graphics.Gloss.Data.Picture as Gloss
    import Data.Data
    import Physics.Physics
    import Physics.Collision
    import TypeClasses.Renderable
    import Data.Number

    shipSpriteMap :: [(SpriteTag, FilePath)]
    shipSpriteMap = [("Ship", "bmp/ship2.bmp")]

    data Ship = Ship {
      s_position :: Gloss.Point,
      r_position :: Gloss.Point,
      s_direction :: Float, -- 0 -> 360
      s_accelerationVector :: VelocityVector,
      s_velocityVector :: VelocityVector,
      s_currentSprite :: SpriteTag,
      s_maxSpeed :: Float,
      s_collisionPath :: Gloss.Path,
      s_rotateSpeed :: Float,
      s_acceleration :: Float
    }

    newShip :: Ship
    newShip = Ship {
      s_position = (0, 0),
      r_position = (0, 0),
      s_currentSprite = "Ship",
      s_direction = pi/2,
      s_accelerationVector = (0, 0),
      s_velocityVector = (0,0),
      s_maxSpeed = 6::Float,
      s_collisionPath = undefined,
      s_rotateSpeed = 0.08::Float,
      s_acceleration = 2::Float
    }

    instance Renderable Ship where
      position ship = s_position ship
      direction ship = s_direction ship
      sprite ship = nextSprite $ s_currentSprite ship
      renderAdditional ship sr = [
        translate (fst drawPosition -8) (snd drawPosition - 32) $ numberToPicture sr (fst position),
        translate (fst drawPosition -8) (snd drawPosition - 41) $ numberToPicture sr (snd position),
        color white $ line $ drawVelocityVector ship]
        where position = r_position ship
              drawPosition = s_position ship

    nextSprite :: SpriteTag -> SpriteTag
    nextSprite s = s

    accelerateShip :: VelocityVector -> Ship -> (Ship,Gloss.Point)
    accelerateShip gravity ship = (ship',bgShift)
      where pos = s_position ship
            rpos = r_position ship
            vv = s_velocityVector ship
            av = s_accelerationVector ship
            vv' = velocityDecay $ newVelocityVector 120 gravity $ newVelocityVector (s_maxSpeed ship) av vv
            (pos',bounded) = newPos pos vv'
            bgShift = if bounded then vv' else (0,0)
            ship' = ship { s_position = pos', s_velocityVector = vv', r_position = (fst rpos + fst vv', snd rpos + snd vv') }

    drawVelocityVector :: Ship -> Gloss.Path
    drawVelocityVector ship = velocityPath
      where shipPosition@(x,y) = s_position ship
            (vx,vy) = s_velocityVector ship
            (ax,ay) = s_accelerationVector ship
            direction = s_direction ship
            velocityPath = shipPosition : (x+vx*10, y+vy*10) : []
