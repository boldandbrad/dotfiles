return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup()

    vim.keymap.set("n", "<leader>tm", "<cmd>ToggleTerm <cr>")
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { buffer = 0 })
  end,
}
