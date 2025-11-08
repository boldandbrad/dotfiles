----------------------------------------------------------------
-- basic plugin specs                                         --
----------------------------------------------------------------

return {
  -- lsp config helpers
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
