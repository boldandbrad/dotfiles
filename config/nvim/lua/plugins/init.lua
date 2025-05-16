----------------------------------------------------------------
-- basic plugin specs                                         --
----------------------------------------------------------------

return {
  -- comment/uncomment motions
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- automatically insert bracket pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}
  },

  -- text surrounding motions
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  }
}
