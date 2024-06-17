return {
  "rmagatti/auto-session",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      session_lens = {
        load_on_setup = true
      }
    })

    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

    local keymap = vim.keymap
    keymap.set("n", "<leader>fs", require("auto-session.session-lens").search_session, {
      desc = "Search sessions",
      noremap = true,
    })
    -- keymap.set("n", "<leader>wr", "<cmd>SessionRestore<cr>", { desc = "restore session for cwd" })             -- restore last workspace session for current directory
    -- keymap.set("n", "<leader>ws", "<cmd>SessionSave<cr>", { desc = "save session for auto session root dir" }) -- save workspace session for current working directory
  end,
}
