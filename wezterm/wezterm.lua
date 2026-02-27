local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Environment
config.set_environment_variables = {
  TERM = "xterm-256color",
}

-- Font
config.font = wezterm.font_with_fallback({
  {
    family = "FiraCode Nerd Font Mono",
    weight = "Regular",
    style = "Normal",
  },
})
config.font_rules = {
  {
    intensity = "Bold",
    italic = false,
    font = wezterm.font("FiraCode Nerd Font Mono", { weight = "DemiBold", style = "Normal" }),
  },
  {
    intensity = "Bold",
    italic = true,
    font = wezterm.font("FiraCode Nerd Font Mono", { weight = "DemiBold", style = "Italic" }),
  },
  {
    intensity = "Normal",
    italic = true,
    font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Regular", style = "Italic" }),
  },
}
config.font_size = 12.0

-- Tabs
config.enable_tab_bar = false

-- Bell
config.audible_bell = "Disabled"

-- Window
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Option/Alt key behavior (equivalent to option_as_alt = "Both")
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- Mouse
config.hide_mouse_cursor_when_typing = true

-- Keyboard bindings
-- Cmd+1-9: send tmux select-window escape sequences (\x02 + digit)
-- Alt+1-9: same sequences
local keys = {}

local num_chars = {
  { key = "1", char = "\x021" },
  { key = "2", char = "\x022" },
  { key = "3", char = "\x023" },
  { key = "4", char = "\x024" },
  { key = "5", char = "\x025" },
  { key = "6", char = "\x026" },
  { key = "7", char = "\x027" },
  { key = "8", char = "\x028" },
  -- Note: in alacritty config both Key9 and Key8 sent \x028 — preserving that here
  { key = "9", char = "\x028" },
}

for _, binding in ipairs(num_chars) do
  table.insert(keys, {
    key = binding.key,
    mods = "SUPER",
    action = wezterm.action.SendString(binding.char),
  })
  table.insert(keys, {
    key = binding.key,
    mods = "ALT",
    action = wezterm.action.SendString(binding.char),
  })
end

-- F11: toggle fullscreen
table.insert(keys, {
  key = "F11",
  mods = "",
  action = wezterm.action.ToggleFullScreen,
})

config.keys = keys

return config
