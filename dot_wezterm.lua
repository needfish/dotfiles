-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Status bar: show battery and date/time on the right side
wezterm.on('update-right-status', function(window, pane)
  local date = wezterm.strftime('%a %b %-d %H:%M')

  local bat = ''
  for _, b in ipairs(wezterm.battery_info()) do
    bat = ' ' .. string.format('%.0f%%', b.state_of_charge * 100)
  end

  window:set_right_status(bat .. '   ' .. date .. '  ')
end)

-- Keybindings for terminal multiplexing
local act = wezterm.action

config.keys = {
  -- Pane navigation (Alt + h/j/k/l)
  { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection 'Left' },
  { key = 'j', mods = 'ALT', action = act.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'ALT', action = act.ActivatePaneDirection 'Up' },
  { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection 'Right' },

  -- Create panes (splits)
  { key = 'd', mods = 'ALT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },  -- Alt-d: split right
  { key = 'D', mods = 'ALT|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } }, -- Alt-Shift-d: split down

  -- Close current pane
  { key = 'w', mods = 'ALT', action = act.CloseCurrentPane { confirm = false } },

  -- Resize panes (Alt + Shift + arrows)
  { key = 'LeftArrow',  mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Left', 5 } },
  { key = 'RightArrow', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Right', 5 } },
  { key = 'UpArrow',    mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Up', 5 } },
  { key = 'DownArrow',  mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Down', 5 } },

  -- Zoom/unzoom current pane (fullscreen within the window)
  { key = 'Enter', mods = 'ALT', action = act.TogglePaneZoomState },

  -- Tab management
  { key = 't', mods = 'ALT', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = '[', mods = 'ALT', action = act.ActivateTabRelative(-1) },
  { key = ']', mods = 'ALT', action = act.ActivateTabRelative(1) },
}

config.window_background_opacity = 0.85
config.macos_window_background_blur = 20


config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "TITLE | RESIZE"
config.integrated_title_button_style = "MacOsNative"
config.font = wezterm.font("Kitan Mono")
config.font_size = 16
config.color_scheme = "Ayu Dark (Gogh)"

-- Tab Bar Configuration
config.enable_tab_bar = true
config.show_tab_index_in_tab_bar = false
config.use_fancy_tab_bar = true
config.window_frame = {
  font = wezterm.font('Kitan Mono'),
  font_size = 12,
}


return config


