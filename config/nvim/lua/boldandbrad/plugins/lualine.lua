----------------------------------------------------------------
-- lualine.nvim - customizable status line                    --
----------------------------------------------------------------

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "rmagatti/auto-session",
    "cbochs/grapple.nvim",
  },
  opts = {
    sections = {
      lualine_c = {
        require("auto-session.lib").current_session_name,
        "filename",
        "grapple",
      }
    },
    options = {
      theme = "catppuccin",
      icons_enabled = false,
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
      globalstatus = true,
    },
  },
}
