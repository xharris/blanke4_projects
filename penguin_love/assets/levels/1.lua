return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.14.2",
  orientation = "orthogonal",
  renderorder = "left-down",
  width = 20,
  height = 20,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 8,
  properties = {},
  tilesets = {
    {
      name = "g_normal",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../image/ground.png",
      imagewidth = 128,
      imageheight = 128,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 16,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "tiles",
      x = 0,
      y = 0,
      width = 20,
      height = 20,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 4, 0, 14, 15, 16, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1, 0, 14, 15, 15, 15, 15, 15, 11, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      name = "markers",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 5,
          name = "start",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 288,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "end",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 224,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
