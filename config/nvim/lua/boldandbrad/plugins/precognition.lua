----------------------------------------------------------------
-- precognition.nvim - motion tutor/helper                    --
----------------------------------------------------------------

return {
  "tris203/precognition.nvim",
  cmd = "Precognition",
  opts = {
    startVisible = false,
  },
  keys = {
    { "<leader>hp", mode = { "n", "x", "o" }, "<cmd>Precognition peek<cr>",   desc = "Precognition Peek" },
    { "<leader>ht", mode = { "n", "x", "o" }, "<cmd>Precognition toggle<cr>", desc = "Precognition Toggle" },
  }
}
