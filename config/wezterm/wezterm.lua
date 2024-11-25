----------------------------------------------------------------
-- wezterm.lua - terminal emulator config                     --
----------------------------------------------------------------

local wezterm = require "wezterm"
local config = {}

-- window startup
wezterm.on("gui-startup", function(cmd)
  local _tab, _pane, window = wezterm.mux.spawn_window(cmd or {})
  local screen = wezterm.gui.screens().main

  -- set initial window size
  local ratio = 0.9
  local width, height = screen.width * ratio, screen.height * ratio
  window:gui_window():set_inner_size(width, height)

  -- center window
  local x = (screen.width - width) * 0.5
  local y = (screen.height - height) * 0.5
  window:gui_window():set_position(x, y)
end)

-- toggle background opacity
wezterm.on("toggle-bg-opacity", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 1
  else
    overrides.window_background_opacity = nil
  end

  window:set_config_overrides(overrides)
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
config.macos_window_background_blur = 20
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.95

-- colors
config.color_scheme = "Catppuccin Mocha"
config.command_palette_bg_color = "#181825"
config.command_palette_fg_color = "#cdd6f4"

-- font
config.font = wezterm.font_with_fallback {
  { family = "AnonymicePro Nerd Font", weight = "Regular" },
  "Apple Color Emoji",
}
config.font_size = 16

-- tab bar
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.tab_max_width = 24

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

-- keys
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
  {
    key = "]",
    mods = "LEADER",
    action = wezterm.action.EmitEvent("toggle-bg-opacity")
  }
}

-- command palette
config.command_palette_font_size = config.font_size
config.command_palette_rows = 16
config.window_frame = {
  font = config.font
}

-- other
config.audible_bell = "Disabled"

return config
