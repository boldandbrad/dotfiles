----------------------------------------------------------------
-- peek.nvim - markdown previewer                             --
----------------------------------------------------------------

return {
  "toppair/peek.nvim",
  event = { "VeryLazy" },
  build = "deno task --quiet build:fast",
  opts = {
    auto_load = false,
  },
  keys = {
    {
      "<leader>v",
      function()
        if require("peek").is_open() then
          require("peek").close()
        else
          require("peek").open()
        end
      end,
      desc = "Toggle markdown preview"
    },
  },
}
