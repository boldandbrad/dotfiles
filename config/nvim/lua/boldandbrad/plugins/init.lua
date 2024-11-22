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
}
