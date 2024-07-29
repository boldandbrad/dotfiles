----------------------------------------------------------------
-- auto-session - session manager                             --
----------------------------------------------------------------

return {
  "rmagatti/auto-session",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  lazy = false,
  opts = {
    bypass_session_save_file_types = { "alpha" },
    session_lens = {
      load_on_setup = true
    },
  },
  keys = {
    {
      "<leader>fs",
      function()
        require("auto-session.session-lens").search_session()
      end,
      desc = "Search sessions",
    },
  },
}
