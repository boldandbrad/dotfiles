----------------------------------------------------------------
-- wezterm.lua - terminal emulator config                     --
----------------------------------------------------------------

local wezterm = require "wezterm"
local config = wezterm.config_builder()

-- window startup position
wezterm.on("gui-startup", function(cmd)
  local _, _, window = wezterm.mux.spawn_window(cmd or {})
  local screen = wezterm.gui.screens().main

  -- set initial window size
  local ratio = 0.64
  local width, height = screen.width * ratio, screen.height * ratio
  window:gui_window():set_inner_size(width, height)

  -- center window
  local x, y = (screen.width - width) * 0.5, (screen.height - height) * 0.5
  window:gui_window():set_position(x, y)
end)

-- render
config.max_fps = 120
config.front_end = "WebGpu"

-- window
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.window_padding = {
  left = 24,
  right = 24,
  top = 48,
  bottom = 4,
}
config.adjust_window_size_when_changing_font_size = false
config.macos_window_background_blur = 12
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.96

-- colors
config.color_scheme = "Catppuccin Mocha"
config.command_palette_bg_color = "#181825"
config.command_palette_fg_color = "#cdd6f4"
config.colors = {
  tab_bar = {
    background = "#1e1e2e",
    active_tab = {
      bg_color = "#cba6f7",
      fg_color = "#181825",
      intensity = "Bold"
    },
    inactive_tab = {
      bg_color = "#1e1e2e",
      fg_color = "#cdd6f4"
    },
    inactive_tab_hover = {
      bg_color = "#181825",
      fg_color = "#cdd6f4"
    }
  }
}

-- font
config.font = wezterm.font_with_fallback {
  { family = "SpaceMono Nerd Font",    weight = "Regular" },
  { family = "Maple Mono NF",          weight = "Regular" },
  { family = "AnonymicePro Nerd Font", weight = "Regular" },
  "Apple Color Emoji",
}
config.font_size = 15

-- tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 24

-- command palette
config.command_palette_font_size = config.font_size
config.command_palette_rows = 16
config.window_frame = {
  font = config.font
}

-- other
config.audible_bell = "Disabled"

return config
