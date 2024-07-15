----------------------------------------------------------------
-- basic plugins                                              --
----------------------------------------------------------------

return {
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
