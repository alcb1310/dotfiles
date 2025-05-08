local wezterm = require 'wezterm'

local config  = wezterm.config_builder()
config        = {
  term                         = 'wezterm',
  font                         = wezterm.font('Iosevka Nerd Font'),
  font_size                    = 8,

  window_decorations           = "NONE",
  -- window_background_opacity    = 0.8,
  hide_tab_bar_if_only_one_tab = true,

  window_close_confirmation    = "NeverPrompt",
  window_padding               = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  window_background_image      = "/home/andres/dotfiles/backgrounds/wp2867758-debian-anime-wallpaper.png",
}

return config
