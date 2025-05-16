----------------------------------------------------------------
-- gitsigns.nvim - git signs, blames, and hunk actions        --
----------------------------------------------------------------

return {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  cmd = "Gitsigns",
  opts = {},
  keys = {
    { "<leader>ghv", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview hunk" },
    { "<leader>ghs", "<cmd>Gitsigns stage_hunk<cr>",          desc = "Stage hunk" },
    { "<leader>ghu", "<cmd>Gitsigns undo_stage_hunk<cr>",     desc = "Unstage hunk" },
    { "<leader>gbs", "<cmd>Gitsigns stage_buffer<cr>",        desc = "Stage buffer" },
    { "<leader>ghr", "<cmd>Gitsigns reset_hunk<cr>",          desc = "Reset hunk" },
    { "<leader>gbr", "<cmd>Gitsigns reset_buffer<cr>",        desc = "Reset buffer" },
    { "<leader>gd",  "<cmd>Gitsigns diffthis<cr>",            desc = "Diff buffer" },
  },
}
