----------------------------------------------------------------
-- lualine.nvim - customizable status line                    --
----------------------------------------------------------------

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
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
      -- override catppuccin theme to have transparent background
      theme = function()
        local custom_catppuccin = require("lualine.themes.catppuccin")
        custom_catppuccin.normal.c.bg = "None"
        return custom_catppuccin
      end,
      icons_enabled = false,
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
      globalstatus = true,
    },
  },
}
