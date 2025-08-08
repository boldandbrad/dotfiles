----------------------------------------------------------------
-- catppuccin.nvim - soothing pastel color theme              --
----------------------------------------------------------------

return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd([[colorscheme catppuccin]])
  end,
  opts = {
    flavour = "mocha",
    transparent_background = true,
    float = { transparent = true },
    integrations = {
      blink_cmp = true,
      fidget = true,
      flash = true,
      gitsigns = {
        enabled = true,
        transparent = true,
      },
      native_lsp = { enabled = true },
      nvim_surround = true,
      snacks = {
        enabled = true,
        indent_scope_color = "peach",
      },
      treesitter = true,
      which_key = true,
    },
  },
}
