-- Color palette and semantic color mappings
-- This module centralizes all color definitions for easier theme management
local M = {}

-- Catppuccin color palette
M.catppuccin = {
  -- Primary colors
  blue = "#89b4fa",
  purple = "#cba6f7",
  pink = "#f38ba8",
  green = "#a6e3a1",
  yellow = "#f9e2af",
  orange = "#fab387",
  cyan = "#89dceb",
  red = "#f38ba8",

  -- Text colors
  text = "#cdd6f4",
  subtext1 = "#bac2de",
  subtext0 = "#a6adc8",
  overlay2 = "#9399b2",
  overlay1 = "#7f849c",
  overlay0 = "#6c7086",
  surface2 = "#585b70",
  surface1 = "#45475a",
  surface0 = "#313244",

  -- Background colors
  base = "#1e1e2e",
  mantle = "#181825",
  crust = "#11111b",
  bg_dark = "#1a2332",
  bg_darker = "#11111b",

  -- Special colors
  lavender = "#b4befe",
  sky = "#89dceb",
  sapphire = "#74c7ec",
  teal = "#94e2d5",
  maroon = "#eba0ac",
  peach = "#fab387",
  rosewater = "#f5e0dc",
  flamingo = "#f2cdcd",
}

-- Semantic color mappings for syntax highlighting
M.semantic = {
  -- Code elements
  comment = M.catppuccin.blue,
  keyword = M.catppuccin.purple,
  func = M.catppuccin.blue,
  string = M.catppuccin.green,
  number = M.catppuccin.orange,
  bool = M.catppuccin.pink,
  type = M.catppuccin.yellow,
  constant = M.catppuccin.orange,
  variable = M.catppuccin.text,
  operator = M.catppuccin.cyan,
  parameter = M.catppuccin.rosewater,

  -- UI elements
  cursor_line = "#1a2332",
  visual_bg = "#313244",
  pmenu_bg = "#1e1e2e",
  pmenu_sel = "#313244",

  -- Git colors
  git_add = M.catppuccin.green,
  git_change = M.catppuccin.yellow,
  git_delete = M.catppuccin.red,

  -- Diagnostic colors
  error = M.catppuccin.red,
  warn = M.catppuccin.yellow,
  info = M.catppuccin.blue,
  hint = M.catppuccin.teal,
}

-- TreeSitter specific colors
M.treesitter = {
  keyword = M.catppuccin.purple,
  func = M.catppuccin.blue,
  func_builtin = M.catppuccin.peach,
  string = M.catppuccin.green,
  number = M.catppuccin.orange,
  boolean = M.catppuccin.pink,
  type = M.catppuccin.yellow,
  type_builtin = M.catppuccin.yellow,
  constructor = M.catppuccin.sapphire,
  constant = M.catppuccin.orange,
  constant_builtin = M.catppuccin.peach,
  variable = M.catppuccin.text,
  variable_builtin = M.catppuccin.red,
  parameter = M.catppuccin.rosewater,
  field = M.catppuccin.teal,
  property = M.catppuccin.teal,
  operator = M.catppuccin.cyan,
  punctuation = M.catppuccin.overlay2,
  tag = M.catppuccin.peach,
  attribute = M.catppuccin.yellow,
  label = M.catppuccin.sapphire,
  namespace = M.catppuccin.yellow,
}

return M
