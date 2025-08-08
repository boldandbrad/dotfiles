----------------------------------------------------------------
-- todo-comments.nvim - todo comment finder                   --
----------------------------------------------------------------

return {
  "folke/todo-comments.nvim",
  event = "BufEnter",
  opts = {
    signs = false,
  },
  keys = {
    { "<leader>st", function() Snacks.picker.todo_comments() end,                                          desc = "Todo" },
    { "<leader>sT", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
  },
}
