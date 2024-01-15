-- set colorscheme if it exists
local colorscheme = "catppuccin"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

-- load lua modules
require("boldandbrad.options")
require("boldandbrad.keymaps")
require("boldandbrad.lazy_init")
