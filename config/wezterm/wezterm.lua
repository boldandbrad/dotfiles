local wezterm = require "wezterm"
local config = {}

-- colors
config.color_scheme = "Catppuccin Mocha"
config.command_palette_bg_color = "#181825"
config.command_palette_fg_color = "#cdd6f4"

-- window
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.window_padding = {
  left = 24,
  right = 24,
  top = 48,
  bottom = 4,
}
config.initial_cols = 128
config.initial_rows = 32
-- config.window_background_opacity = 0.95
-- config.macos_window_background_blur = 20

-- tab bar
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = false

-- lualine inspired tabline
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
  options = {
    icons_enabled = false,
    section_separators = "",
    component_separators = {
      left = "|",
      right = "|",
    },
    tab_separators = "",
  }
})

-- font
config.font = wezterm.font_with_fallback {
  { family = "AnonymicePro Nerd Font", weight = "Regular" },
  "Apple Color Emoji",
}
config.font_size = 16

-- command palette
config.command_palette_font_size = config.font_size
config.command_palette_rows = 16
config.window_frame = {
  font = config.font
}

-- other
config.audible_bell = "Disabled"

return config
