----------------------------------------------------------------
-- trouble.nvim - diagnostics and reference jumper            --
----------------------------------------------------------------

return {
  "folke/trouble.nvim",
  enabled = true,
  cmd = "Trouble",
  opts = {
    focus = true,
  },
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
  },
}
