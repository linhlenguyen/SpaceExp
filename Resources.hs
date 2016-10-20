module Resources(
loadResource,
SpriteTag
)
  where
    import qualified Graphics.Gloss.Data.Picture as Gloss
    import Data.Data

    type SpriteTag = String

    allSprites :: [(SpriteTag, FilePath)]
    allSprites = undefined --Collect all sprites info from modules

    bmpTagMap :: [(Sprite, FilePath)]
    bmpTagMap = [(ShipSprite, "bmp/ship2.bmp")]

    loadResource :: IO [(Sprite, Gloss.Picture)]
    loadResource = loadResource' bmpTagMap

    loadResource' :: [(Sprite, FilePath)] -> IO [(Sprite, Gloss.Picture)]
    loadResource' [] = return []
    loadResource' ((s,p):xs) = do
      bmp <- Gloss.loadBMP p
      bmps <- loadResource' xs
      return ((s,bmp):bmps)
