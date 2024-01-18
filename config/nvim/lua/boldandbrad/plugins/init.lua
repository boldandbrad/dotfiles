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
    "christoomey/vim-tmux-navigator",
    lazy = false
  },
}
