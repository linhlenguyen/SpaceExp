module Resources(
loadResource
)
  where
    import qualified Graphics.Gloss.Data.Picture as Gloss
    import Data.Data

    data SpriteTag = ShipSprite | Rocket deriving (Eq)

    bmpTagMap :: [(SpriteTag, FilePath)]
    bmpTagMap = [(ShipSprite, "bmp/ship.bmp")]

    loadResource :: IO [(SpriteTag, Gloss.Picture)]
    loadResource = loadResource' bmpTagMap

    loadResource' :: [(Sprite, FilePath)] -> IO [(SpriteTag, Gloss.Picture)]
    loadResource' [] = return []
    loadResource' ((s,p):xs) = do
      bmp <- Gloss.loadBMP p
      bmps <- loadResource' xs
      return ((s,bmp):bmps)
