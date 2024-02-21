-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

local act = wezterm.action
local mux = wezterm.mux

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

wezterm.on('gui-startup', function(cmd) -- set startup Window position
  local tab, pane, window = mux.spawn_window(cmd or{})
  window:gui_window():set_position(80, 100)
end)

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'nord'
config.color_scheme = 'Catppuccin Mocha'

config.hide_tab_bar_if_only_one_tab = true

config.initial_cols = 200
config.initial_rows = 60

config.font =
  wezterm.font('JetBrainsMono Nerd Font')

-- Window size position and decoration
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.keys = {
  -- Switch to the default workspace
  {
    key = 'y',
    mods = 'CTRL|SHIFT',
    action = act.SwitchToWorkspace {
      name = 'default',
    },
  },
  -- Switch to a monitoring workspace, which will have `top` launched into it
  {
    key = 'u',
    mods = 'CTRL|SHIFT',
    action = act.SwitchToWorkspace {
      name = 'monitoring',
      spawn = {
        args = { 'top' },
      },
    },
  },
  -- Create a new workspace with a random name and switch to it
  { key = 'i', mods = 'CTRL|SHIFT', action = act.SwitchToWorkspace },
  -- Show the launcher in fuzzy selection mode and have it list all workspaces
  -- and allow activating one.
  {
    key = '9',
    mods = 'ALT',
    action = act.ShowLauncherArgs {
      flags = 'FUZZY|WORKSPACES',
    },
  },
  { key = 'l', mods = 'ALT', action = wezterm.action.ShowLauncher },
}

-- and finally, return the configuration to wezterm
return config

