---@type ChadrcConfig
local M = {}

M.ui = {
  -- set default theme
  theme = 'catppuccin',
  -- enable nvchad dashboard on startup
  nvdash = {
    load_on_startup = true
  }
}

M.plugins = "custom.plugins"

M.lazy_nvim = {
  install = {
    colorscheme = { "nvchad" },
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = true,
  },
}

return M
