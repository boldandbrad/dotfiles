----------------------------------------------------------------
-- gitsigns.nvim - git signs, blames, and hunk actions        --
----------------------------------------------------------------

return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()
    vim.keymap.set("n", "<leader>ghv", ":Gitsigns preview_hunk_inline <CR>", { desc = "Preview hunk" })
    vim.keymap.set("n", "<leader>ghs", ":Gitsigns stage_hunk <CR>", { desc = "Stage hunk" })
    vim.keymap.set("n", "<leader>ghu", ":Gitsigns undo_stage_hunk <CR>", { desc = "Undo stage hunk" })
    vim.keymap.set("n", "<leader>gbs", ":Gitsigns stage_buffer <CR>", { desc = "Stage buffer" })
    vim.keymap.set("n", "<leader>ghr", ":Gitsigns reset_hunk <CR>", { desc = "Reset hunk" })
    vim.keymap.set("n", "<leader>gbr", ":Gitsigns reset_buffer <CR>", { desc = "Reset buffer" })
    vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis <CR>", { desc = "Diff buffer" })
  end
}
