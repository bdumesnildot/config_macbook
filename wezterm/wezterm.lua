local wezterm = require 'wezterm'
local config = {}
local keys = {}
local mouse_bindings = {}
local launch_menu = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Window appearance config
config.color_scheme = 'DWM rob (terminal.sexy)'
config.window_background_opacity = 0.95
config.text_background_opacity = 0.3
config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.5,
}
config.use_fancy_tab_bar = true

-- Text appearance config



return config