module Data.Number(
numberToPicture,
numberBitmapMap
)
  where
    import Graphics.Gloss
    import Data.Data
    import Data.Map.Strict

    numberBitmapMap :: [(SpriteTag, FilePath)]
    numberBitmapMap = [
      ("1", "bmp/1.bmp"),
      ("2", "bmp/2.bmp"),
      ("3", "bmp/3.bmp"),
      ("4", "bmp/4.bmp"),
      ("5", "bmp/5.bmp"),
      ("6", "bmp/6.bmp"),
      ("7", "bmp/7.bmp"),
      ("8", "bmp/8.bmp"),
      ("9", "bmp/9.bmp"),
      ("0", "bmp/0.bmp")]

    type Index = Float

    numberToPicture :: SpriteResource -> Int -> Picture
    numberToPicture sr n = pictures $ numberToPicture' sr 0 $ show n

    numberToPicture' :: SpriteResource -> Index -> String -> [Picture]
    numberToPicture' _ _ [] = []
    numberToPicture' sr index (x:xs) = translate (index*9) 0 (sr!(x:[])) : numberToPicture' sr (index+1) xs
