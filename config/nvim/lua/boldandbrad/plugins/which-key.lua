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
    wk.register({
      ["<leader>j"] = { name = "+Jump Tagged Buffers (Grapple)" },
      ["<leader>f"] = { name = "+Find" },
      ["<leader>g"] = { name = "+Git" },
      ["<leader>h"] = { name = "+Help" },
      ["<leader>l"] = { name = "+LSP" },
      ["<leader>x"] = { name = "+Diagnostics" },
    })
  end,
  opts = {
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
      breadcrumb = ">",
      separator = ">",
    },
    window = {
      border = "rounded",
    },
  },
}
