----------------------------------------------------------------
-- catppuccin.nvim - soothing pastel color theme              --
----------------------------------------------------------------

return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,    -- load during startup
  priority = 1000, -- load before other plugins
  init = function()
    vim.cmd([[colorscheme catppuccin]])
  end,
  opts = {
    flavour = "mocha",
    integrations = {
      alpha = true,
      cmp = true,
      fidget = true,
      flash = true,
      gitsigns = true,
      grug_far = true,
      lsp_trouble = true,
      mason = true,
      telescope = { enabled = true },
      treesitter = true,
      which_key = true,
    },
  },
}
