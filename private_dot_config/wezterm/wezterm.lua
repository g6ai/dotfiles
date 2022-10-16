local wezterm = require 'wezterm';

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'GruvboxDark (Gogh)'
  else
    return 'PaperColorLight (Gogh)'
  end
end

return {
  font = wezterm.font("JetBrainsMono Nerd Font"),
  font_size = 20.0,
  color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
  default_cursor_style = "BlinkingBar",
  cursor_blink_rate = 500,
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
  native_macos_fullscreen_mode = true,
  window_background_opacity = 0.9,
  keys = {
    {key = "Enter", mods = "ALT", action = "DisableDefaultAssignment"},
    {key = "f", mods = "CTRL|SUPER", action = "ToggleFullScreen"},
  },
}
