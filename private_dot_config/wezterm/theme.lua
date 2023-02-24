local wezterm = require 'wezterm'
local misc = require 'misc'

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = tab.tab_index + 1 .. ': ' .. misc.basename(tab.active_pane.foreground_process_name)

    return {
      { Text = ' ' .. title .. ' ' },
    }
  end
)

wezterm.on(
  'window-resized',
  function(window, pane)
    local overrides = window:get_config_overrides() or {}

    if window:get_dimensions().is_full_screen then
      overrides.window_background_opacity = 1
      overrides.text_background_opacity = 1
    else
      overrides.window_background_opacity = 0.6
      overrides.text_background_opacity = 0.4
    end

    window:set_config_overrides(overrides)
  end
)

local module = {}

function module.scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Gruvbox dark, hard (base16)'
  else
    return 'One Light (base16)'
  end
end

function module.scheme_for_tab_bar(appearance)
  if appearance:find 'Dark' then
    return {
      -- Using https://github.com/sainnhe/gruvbox-material
      -- mix hard dark
      background = '#504945', -- bg5

      active_tab = {
        bg_color = '#1d2021', -- bg0
        fg_color = '#e2cca9', -- fg0=fg1
        intensity = 'Bold',
      },

      inactive_tab = {
        bg_color = '#3c3836', -- bg3=bg4
        fg_color = '#e2cca9', -- fg0=fg1
      },

      inactive_tab_hover = {
        bg_color = '#e2cca9', -- fg0=fg1
        fg_color = '#3c3836', -- bg3=bg4
        italic = true,
      },

      new_tab = {
        bg_color = '#3c3836', -- bg3=bg4
        fg_color = '#e2cca9', -- fg0=fg1
      },

      new_tab_hover = {
        bg_color = '#e2cca9', -- fg0=fg1
        fg_color = '#3c3836', -- bg3=bg4
        italic = true,
      },
    }
  else
    return {
      -- Using https://github.com/sainnhe/edge
      -- light
      background = '#bac3cb', -- gray_dim

      active_tab = {
        bg_color = '#fafafa', -- bg0
        fg_color = '#4b505b', -- fg
        intensity = 'Bold',
      },

      inactive_tab = {
        bg_color = '#dde2e7', -- bg4=black
        fg_color = '#4b505b', -- fg
      },

      inactive_tab_hover = {
        bg_color = '#4b505b', -- fg
        fg_color = '#dde2e7', -- bg4=black
        italic = true,
      },

      new_tab = {
        bg_color = '#dde2e7', -- bg4=black
        fg_color = '#4b505b', -- fg
      },

      new_tab_hover = {
        bg_color = '#4b505b', -- fg
        fg_color = '#dde2e7', -- bg4=black
        italic = true,
      },
    }
  end
end

return module
