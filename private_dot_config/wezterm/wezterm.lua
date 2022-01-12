local wezterm = require 'wezterm';
return {
  font = wezterm.font("JetBrainsMono Nerd Font"),
  font_size = 20.0,
  color_scheme = "Gruvbox Dark",
  force_reverse_video_cursor = true,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  window_decorations = "RESIZE",
  native_macos_fullscreen_mode = true
}
