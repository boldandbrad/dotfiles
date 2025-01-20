----------------------------------------------------------------
-- auto-session - session manager                             --
----------------------------------------------------------------

return {
  "rmagatti/auto-session",
  lazy = false,
  opts = {
    session_lens = {
      load_on_setup = true
    },
  },
  keys = {
    { "<leader>fs", "<cmd>SessionSearch<cr>", desc = "Search sessions" },
  },
}
