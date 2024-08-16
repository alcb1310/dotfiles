local wezterm = require("wezterm")

local config = wezterm.config_builder()
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 12.0
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}
config.color_scheme = "Catppuccin"
-- config.window_decorations = "RESIZE"
-- config.window_background_opacity = 0.8
-- config.text_background_opacity = 1.0
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true
config.enable_tab_bar = false

config.window_background_image = "/Users/andres/Pictures/1236336.jpg"
config.window_background_image_hsb = {
	brightness = 0.1,

	-- You can adjust the hue by scaling its value.
	-- a multiplier of 1.0 leaves the value unchanged.
	hue = 2.0,

	-- You can adjust the saturation also.
	saturation = 0.2,
}

return config
