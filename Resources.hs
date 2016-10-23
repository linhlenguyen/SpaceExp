module Resources(
loadResource,
SpriteTag
)
  where
    import qualified Graphics.Gloss.Data.Picture as Gloss
    import qualified Graphics.Gloss.Data.Bitmap as Gloss
    import Data.Data
    import Data.Ship
    import Data.Moon
    import Data.StarField

    allSprites :: [(SpriteTag, FilePath)]
    allSprites = shipSpriteMap ++ moonSpriteMap ++ starFieldSpriteMap

    loadResource :: IO [(SpriteTag, Gloss.Picture)]
    loadResource = loadResource' allSprites

    loadResource' :: [(SpriteTag, FilePath)] -> IO [(SpriteTag, Gloss.Picture)]
    loadResource' [] = return []
    loadResource' ((s,p):xs) = do
      bmp <- Gloss.loadBMP p
      bmps <- loadResource' xs
      return ((s,bmp):bmps)
