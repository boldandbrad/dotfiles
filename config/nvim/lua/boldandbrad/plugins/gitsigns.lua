return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()
    vim.keymap.set("n", "<leader>ghv", ":Gitsigns preview_hunk_inline <CR>")
    vim.keymap.set("n", "<leader>ghs", ":Gitsigns stage_hunk <CR>")
    vim.keymap.set("n", "<leader>ghu", ":Gitsigns undo_stage_hunk <CR>")
    vim.keymap.set("n", "<leader>gbs", ":Gitsigns stage_buffer <CR>")
    vim.keymap.set("n", "<leader>ghr", ":Gitsigns reset_hunk <CR>")
    vim.keymap.set("n", "<leader>gbr", ":Gitsigns reset_buffer <CR>")
    vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis <CR>")
  end,
}
