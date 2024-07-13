----------------------------------------------------------------
-- which-key.nvim - live keymap explorer                      --
----------------------------------------------------------------

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    -- register keymap group names
    local wk = require("which-key")
    wk.add({
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>h", group = "Help" },
      { "<leader>j", group = "Jump Tagged Buffers (Grapple)" },
      { "<leader>l", group = "LSP" },
      { "<leader>x", group = "Diagnostics" },
    })
  end,
  opts = {
    preset = 'modern',
    plugins = {
      marks = false,
      registers = false,
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true
      }
    },
    icons = {
      rules = false,
      breadcrumb = ">",
      separator = ">",
    },
  },
}
