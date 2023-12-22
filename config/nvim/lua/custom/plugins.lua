local plugins = {
  -- override default lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  -- override default mason config
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust_analyzer",
      }
    }
  },
  -- add vim-tmux navigator
  {
    "christoomey/vim-tmux-navigator"
  },
}
return plugins
