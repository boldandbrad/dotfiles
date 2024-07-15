----------------------------------------------------------------
-- todo-comments.nvim - todo comment finder                   --
----------------------------------------------------------------

return {
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim"
  },
  opts = {},
  cmd = {
    "TodoTrouble",
    "TodoTelescope",
  },
  keys = {
    { "<leader>xt", "<cmd>Trouble todo<cr>",  desc = "Open TODOs (Trouble)" },
    { "<leader>fd", "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
  },
}
