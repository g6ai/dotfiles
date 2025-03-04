local wezterm = require 'wezterm'
local theme = require 'theme'

return {
  font = wezterm.font("JetBrainsMono Nerd Font"),
  font_size = 20.0,
  default_cursor_style = "BlinkingBar",
  cursor_blink_rate = 500,
  force_reverse_video_cursor = true,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,
  color_scheme = theme.scheme_for_appearance(wezterm.gui.get_appearance()),
  colors = {
    tab_bar = theme.scheme_for_tab_bar(wezterm.gui.get_appearance()),
  },
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  window_decorations = "RESIZE",
  native_macos_fullscreen_mode = true,
  window_close_confirmation = "NeverPrompt",
  window_background_opacity = 0.6,
  text_background_opacity = 0.4,
  keys = {
    {key = "Enter", mods = "ALT", action = "DisableDefaultAssignment"},
    {key = "f", mods = "CTRL|SUPER", action = "ToggleFullScreen"},
    {key = 'n', mods = 'CTRL|SHIFT', action = wezterm.action.SpawnCommandInNewWindow {cwd = '~'}},
    {key = 't', mods = 'CTRL|SHIFT', action = wezterm.action.SpawnCommandInNewTab {cwd = '~'}},
  },
}
