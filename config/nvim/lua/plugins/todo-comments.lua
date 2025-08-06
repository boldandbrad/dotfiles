----------------------------------------------------------------
-- todo-comments.nvim - todo comment finder                   --
----------------------------------------------------------------

return {
  "folke/todo-comments.nvim",
  event = "BufEnter",
  opts = {
    keywords = {
      FIX = { icon = "*" },
      HACK = { icon = "?" },
      NOTE = { icon = "i" },
      PERF = { icon = "/" },
      TEST = { icon = ">" },
      TODO = { icon = "+" },
      WARN = { icon = "!" },
    },
  },
  keys = {
    { "<leader>st", function() Snacks.picker.todo_comments() end,                                          desc = "Todo" },
    { "<leader>sT", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
  },
}
