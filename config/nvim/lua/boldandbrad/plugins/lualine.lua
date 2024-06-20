return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "rmagatti/auto-session",
    "cbochs/grapple.nvim",
  },
  config = function()
    require("lualine").setup({
      sections = {
        lualine_c = {
          require("auto-session.lib").current_session_name,
          "grapple",
          "filename",
        }
      },
      options = {
        icons_enabled = false,
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
    })
  end,
}
