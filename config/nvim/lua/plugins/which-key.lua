----------------------------------------------------------------
-- which-key.nvim - live keymap explorer                      --
----------------------------------------------------------------

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    require("which-key").add({
      { "<leader>b", group = "Buffer" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>h", group = "Help" },
      { "<leader>j", group = "Jump" },
      { "<leader>l", group = "LSP" },
      { "<leader>r", group = "Replace" },
      { "<leader>s", group = "Search" },
      { "<leader>t", group = "Terminal" },
      { "<leader>w", group = "Window" },
    })
  end,
  opts = {
    preset = "helix",
    show_help = false,
    plugins = {
      marks = false,
      registers = false,
    },
    icons = {
      rules = false,
      breadcrumb = ">",
      separator = ">",
    },
  },
}
