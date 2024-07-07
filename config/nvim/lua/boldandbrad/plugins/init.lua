----------------------------------------------------------------
-- basic plugins                                              --
----------------------------------------------------------------

return {
  -- color theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,    -- load during startup
    priority = 1000, -- load before other plugins
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
  },

  -- color code highlighter
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },

  -- tmux navigation
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },
}
