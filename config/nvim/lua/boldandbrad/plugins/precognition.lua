----------------------------------------------------------------
-- precognition.nvim - motion tutor/helper                    --
----------------------------------------------------------------

return {
  "tris203/precognition.nvim",
  event = "VeryLazy",
  opts = {
    startVisible = false,
  },
  keys = {
    { "<leader>hp", mode = { "n", "x", "o" }, function() require("precognition").peek() end,   desc = "Precognition Peek" },
    { "<leader>ht", mode = { "n", "x", "o" }, function() require("precognition").toggle() end, desc = "Precognition Toggle" },
  }
}
