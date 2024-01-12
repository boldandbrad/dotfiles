local overrides = require("custom.configs.overrides")

local plugins = {
  -- override default mason config
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "markdownlint",
      }
    }
  },
  -- override default lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  -- override default treesitter config
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  -- add vim-tmux navigator
  {
    "christoomey/vim-tmux-navigator"
  },
}
return plugins
