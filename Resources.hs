module Resources(
loadResource
)
  where
    import qualified Graphics.Gloss.Data.Picture as Gloss
    import Data

    bmpTagMap :: [(Sprite, FilePath)]
    bmpTagMap = []

    loadResource :: IO [(Sprite, Gloss.Picture)]
    loadResource = loadResource' bmpTagMap

    loadResource' :: [(Sprite, FilePath)] -> IO [(Sprite, Gloss.Picture)]
    loadResource' [] = return []
    loadResource' ((s,p):xs) = do
      bmp <- Gloss.loadBMP p
      bmps <- loadResource' xs
      return ((s,bmp):bmps)