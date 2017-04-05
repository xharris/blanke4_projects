return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.14.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 150,
  height = 100,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 22,
  properties = {},
  tilesets = {
    {
      name = "tile_ground",
      firstgid = 1,
      tilewidth = 33,
      tileheight = 33,
      spacing = 0,
      margin = 0,
      image = "../image/tile_ground.png",
      imagewidth = 132,
      imageheight = 132,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 16,
      tiles = {
        {
          id = 0,
          objectGroup = {
            type = "objectgroup",
            name = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            properties = {},
            objects = {}
          }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "groundyoff",
      x = 0,
      y = 0,
      width = 150,
      height = 100,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 16,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJzt1TEKgDAQRcEU0SKCev/TuoIXsAirywy8/hdL0hoAAAAAAAAAAAAAAAAAAADwF2v2AMrYo+MJZvBeMYO7Ar5oyR5ASfef17NHUM6ItujMHgIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA8MIF7IgAcw=="
    },
    {
      type = "tilelayer",
      name = "groundxoff",
      x = 0,
      y = 0,
      width = 150,
      height = 100,
      visible = true,
      opacity = 1,
      offsetx = 16,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJztwTEBAAAAwqD1T20ND6AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAvgzqYAAB"
    },
    {
      type = "tilelayer",
      name = "ground",
      x = 0,
      y = 0,
      width = 150,
      height = 100,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJzt3NtqwkAUQFHpjd5o+/9f20jxxWptMTsJ07XgPAk6DJsYJuhux0ge1l4AQ9IVBV1R0BUFXVHQFQVdUdAVBV1R0BUFXVHQFQVdUdAVBV1R0BUFXVHQFQVdUdAVBV1R0BUFXc3nfu0FbIiu5vP0w2s309wezd0Si1qJruaz38tzrZza58dwLWvT1Xyep3mZ5n2aj6PXdEVBVyxFVxR0xSVvu+/3VJfoimu5v6KgKwpLdXU4f137zFVXy6i6Oj7Hn/O9r6GrZZzb5+NnO3+dc3T1Pyy9z7oaw6nnyr+5rlR09eXa74O1Z2t0RUFXFHRFQVcUdEVBVxR0ReF15c/X1XjWvlbt6Wo8uqKgKwpb6OrwmzfGsYWuDly3xqErCrqioCsKuqKgKwq6orClrpxjjWNLXTEOXVHQFQVdUdAVBV1R0BUFXVH5z/9NAQAAAAAAAAAAAAAAAAAAAAAAADCST4yWBL0="
    },
    {
      type = "objectgroup",
      name = "player",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 17,
          name = "player",
          type = "",
          shape = "rectangle",
          x = 1392,
          y = 960,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "collision",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 15,
          name = "",
          type = "",
          shape = "polyline",
          x = 0,
          y = 1216,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 1536, y = 0 },
            { x = 1536, y = -32 },
            { x = 1792, y = -32 },
            { x = 1792, y = -448 },
            { x = 1984, y = -448 },
            { x = 1984, y = -96 },
            { x = 2496, y = -96 },
            { x = 2496, y = -128 },
            { x = 2624, y = -128 },
            { x = 2624, y = -160 },
            { x = 2720, y = -160 },
            { x = 2720, y = 256 },
            { x = 2688, y = 256 },
            { x = 2688, y = 896 },
            { x = 3552, y = 896 },
            { x = 3552, y = 928 },
            { x = 0, y = 928 },
            { x = 0, y = 0 }
          },
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "polyline",
          x = 1792,
          y = 912,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = -96, y = 0 },
            { x = -96, y = 32 },
            { x = 0, y = 32 },
            { x = 0, y = 0 }
          },
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "",
          shape = "polyline",
          x = 1632,
          y = 1040,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 0, y = 96 },
            { x = 96, y = 96 },
            { x = 96, y = 64 },
            { x = 64, y = 64 },
            { x = 64, y = 32 },
            { x = 32, y = 32 },
            { x = 32, y = 0 },
            { x = 0, y = 0 }
          },
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "polyline",
          x = 1536,
          y = 960,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 0, y = 32 },
            { x = 64, y = 32 },
            { x = 64, y = 0 },
            { x = 0, y = 0 }
          },
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "polyline",
          x = 1568,
          y = 736,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 0, y = 128 },
            { x = 128, y = 128 },
            { x = 128, y = 96 },
            { x = 64, y = 96 },
            { x = 64, y = 64 },
            { x = 32, y = 64 },
            { x = 32, y = 0 },
            { x = 0, y = 0 }
          },
          properties = {}
        }
      }
    }
  }
}
