----------------------------------------------------------------
-- auto-session - session manager                             --
----------------------------------------------------------------

return {
  "rmagatti/auto-session",
  lazy = false,
  opts = {},
  keys = {
    { "<leader>fs", "<cmd>SessionSearch<cr>", desc = "Find sessions" },
  },
}
