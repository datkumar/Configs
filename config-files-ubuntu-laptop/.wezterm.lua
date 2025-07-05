-- Pull in the wezterm API
local wezterm = require("wezterm")
-- This will hold the configuration.
local config = wezterm.config_builder()

-- Terminal identity
config.term = "wezterm"

-- Colors
-- Browse Themes: https://wezterm.org/colorschemes/index.html
config.color_scheme = "Apple System Colors"
config.colors = {
  background = "#141414",
}

-- Window appearance
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 10,
  right = 8,
  top = 8,
  bottom = 8,
}
config.initial_cols = 170
config.initial_rows = 40
config.window_background_opacity = 0.95
config.enable_scroll_bar = false
config.adjust_window_size_when_changing_font_size = false
config.window_close_confirmation = "NeverPrompt"

-- Fonts
config.font = wezterm.font_with_fallback({
  "Geist Mono",
  "Noto Color Emoji",               -- Fallback for emoji
  "Symbols Nerd Font Mono",         -- Fallback for additional glyphs
})
config.font_size = 11.0
config.line_height = 1.1

-- Scrolling
config.scrollback_lines = 12000

-- Cursor
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "EaseIn"
config.cursor_blink_ease_out = "EaseOut"
config.force_reverse_video_cursor = false

-- Bell
config.audible_bell = "Disabled"
config.visual_bell = {
  fade_in_duration_ms = 0,
  fade_out_duration_ms = 0,
  target = "CursorColor",
}

-- Clipboard behavior
config.selection_word_boundary = "semantic"


-- Key bindings 
-- config.keys = {
-- }

-- Finally, return the configuration to wezterm:
return config
