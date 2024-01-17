return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- load during startup
    priority = 1000, -- load before other plugins
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- TODO: add ensure_installed?
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },
}
