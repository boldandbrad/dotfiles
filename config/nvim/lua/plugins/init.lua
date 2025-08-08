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

  -- text surrounding motions
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  -- lsp helpers
  { "neovim/nvim-lspconfig" },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "snacks.nvim",        words = { "Snacks" } },
      }
    }
  },
}
