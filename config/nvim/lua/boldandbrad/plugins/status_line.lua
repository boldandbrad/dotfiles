return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = false,
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {"neo-tree"},
        },
      },
    })
  end,
}
