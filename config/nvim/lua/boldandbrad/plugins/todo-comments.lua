return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
  opts = {},
  cmd = {
    "TodoTrouble",
    "TodoTelescope",
  },
  keys = {
    {
      "<leader>tt",
      "<cmd>TodoTrouble<cr>",
      desc = "Todo comments (Trouble)"
    },
    {
      "<leader>fd",
      "<cmd>TodoTelescope<cr>",
      desc = "Find TODO comments"
    }
  },
}
