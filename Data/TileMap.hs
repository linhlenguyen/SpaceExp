--Randomly generate new map from a list of tiles.
module TileMap()
  where
    import Graphics.Gloss

    data Tile = Tile1 | Tile2 | Tile3 | Tile4 | Tile5

    type Width = Float
    type Height = Float
    type TileMap = [[Sprite]]

    tileWidth = 32::Width
    tileHeight = 32::Height

    tileBmpMap :: [(Tile, FilePath)]
    tileBmpMap = [
      (Tile1, "bmp/tile1.bmp"),
      (Tile2, "bmp/tile2.bmp")
      (Tile3, "bmp/tile3.bmp")
      (Tile4, "bmp/tile4.bmp")
      (Tile5, "bmp/tile5.bmp")
    ]

    render :: Width -> Height -> TileMap -> Picture
    render w h ((x:xs):ys) = undefined

    newTileMap :: TileMap -> Point -> TileMap
    newTileMap tm p = tm

    loadTiles :: [(Tile, FilePath)] -> IO [(Tile, Picture)]
    loadTiles (t,p):xs = do
