----------------------------------------------------------------
-- which-key.nvim - live keymap explorer                      --
----------------------------------------------------------------

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>b", group = "Buffer" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>h", group = "Help" },
      { "<leader>j", group = "Jump" },
      { "<leader>r", group = "Replace" },
      { "<leader>s", group = "Search" },
      { "<leader>t", group = "Terminal" },
      { "<leader>w", group = "Window" },
    },
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
