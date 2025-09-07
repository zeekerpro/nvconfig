-- Custom highlight overrides and additions
-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type HLTable
M.override = {
  -- Don't override Normal here - let transparency work
  -- Background is handled by autocmd in options.lua
  CursorLine = {
    bg = "#1a2332",  -- Slightly lighter than terminal bg
  },
  Comment = {
    italic = true,
    fg = "#89b4fa", -- Brighter blue for comments
  },
  
  -- Enhanced syntax highlighting for more vibrant colors
  Keyword = {
    fg = "#cba6f7", -- Purple for keywords
    bold = true,
  },
  Function = {
    fg = "#89b4fa", -- Blue for functions
    bold = true,
  },
  String = {
    fg = "#a6e3a1", -- Green for strings
  },
  Number = {
    fg = "#fab387", -- Orange for numbers
  },
  Boolean = {
    fg = "#f38ba8", -- Pink for booleans
  },
  Type = {
    fg = "#f9e2af", -- Yellow for types
    bold = true,
  },
  Constant = {
    fg = "#fab387", -- Orange for constants
  },
  Variable = {
    fg = "#cdd6f4", -- Light blue for variables
  },
  Operator = {
    fg = "#89dceb", -- Cyan for operators
  },
  Special = {
    fg = "#f5c2e7", -- Light pink for special chars
  },
  PreProc = {
    fg = "#94e2d5", -- Teal for preprocessor
  },
  Identifier = {
    fg = "#cdd6f4", -- Light blue for identifiers
  },
  -- Colorful statusline - override NvChad's vscode_colored theme
  StatusLine = {
    bg = "#21262D",
    fg = "#F0F6FC",
  },
  -- NvChad vscode_colored statusline colors
  St_NormalMode = {
    fg = "#21262D",
    bg = "#58A6FF",
    bold = true,
  },
  St_InsertMode = {
    fg = "#21262D", 
    bg = "#7EE787",
    bold = true,
  },
  St_VisualMode = {
    fg = "#21262D",
    bg = "#D29922", 
    bold = true,
  },
  St_CommandMode = {
    fg = "#21262D",
    bg = "#F85149",
    bold = true,
  },
  St_TerminalMode = {
    fg = "#21262D",
    bg = "#79C0FF",
    bold = true,
  },
  -- Improve fold colors
  Folded = {
    bg = "#1a2332",
    fg = "#bac2de", -- Light grey
  },
  -- Better search highlighting
  Search = {
    bg = "#f9e2af", -- Yellow for search
    fg = "#1e1e2e",
  },
  IncSearch = {
    bg = "#89b4fa", -- Blue for incremental search
    fg = "#1e1e2e",
  },
  -- Terminal colors consistency
  Terminal = {
    bg = "#141b26",
    fg = "white",
  },
  -- Transparent sign column and line numbers for transparency support
  SignColumn = {
    bg = "NONE",
  },
  LineNrAbove = {
    bg = "NONE", 
  },
  LineNrBelow = {
    bg = "NONE",
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  
  -- TreeSitter highlight groups for more vibrant syntax highlighting
  ["@keyword"] = { fg = "#cba6f7", bold = true },
  ["@function"] = { fg = "#89b4fa", bold = true },
  ["@function.call"] = { fg = "#89b4fa" },
  ["@method"] = { fg = "#89b4fa", bold = true },
  ["@method.call"] = { fg = "#89b4fa" },
  ["@string"] = { fg = "#a6e3a1" },
  ["@string.regex"] = { fg = "#f9e2af" },
  ["@number"] = { fg = "#fab387" },
  ["@boolean"] = { fg = "#f38ba8" },
  ["@type"] = { fg = "#f9e2af", bold = true },
  ["@type.builtin"] = { fg = "#f9e2af" },
  ["@constant"] = { fg = "#fab387" },
  ["@constant.builtin"] = { fg = "#fab387", bold = true },
  ["@variable"] = { fg = "#cdd6f4" },
  ["@variable.builtin"] = { fg = "#f38ba8" },
  ["@operator"] = { fg = "#89dceb" },
  ["@punctuation"] = { fg = "#bac2de" },
  ["@punctuation.bracket"] = { fg = "#89dceb" },
  ["@comment"] = { fg = "#89b4fa", italic = true },
  ["@tag"] = { fg = "#f38ba8" },
  ["@tag.attribute"] = { fg = "#f9e2af" },
  ["@property"] = { fg = "#89dceb" },
  ["@parameter"] = { fg = "#fab387", italic = true },
  ["@field"] = { fg = "#89dceb" },
  ["@namespace"] = { fg = "#cba6f7" },
  ["@include"] = { fg = "#94e2d5" },
  ["@conditional"] = { fg = "#cba6f7", bold = true },
  ["@repeat"] = { fg = "#cba6f7", bold = true },
  ["@exception"] = { fg = "#f38ba8", bold = true },
  -- Enhanced floating window colors
  NormalFloat = {
    bg = "#0f1419",  -- Darker than terminal bg for contrast
    fg = "#cdd6f4", -- White
  },
  FloatBorder = {
    bg = "#0f1419",
    fg = "#bac2de", -- Grey foreground
  },
  -- Popup menu colors
  Pmenu = {
    bg = "#0f1419",
    fg = "#cdd6f4", -- White
  },
  PmenuSel = {
    bg = "#1a2332",
    fg = "#cdd6f4", -- White
  },
  -- Better line numbers
  LineNr = {
    fg = "#6c7086", -- Grey
  },
  CursorLineNr = {
    fg = "#cdd6f4", -- White
    bold = true,
  },
  -- NvimTree with transparency support
  NvimTreeNormal = {
    bg = "NONE",  -- Let it be transparent
    fg = "#cdd6f4", -- White
  },
  NvimTreeFolderIcon = {
    fg = "#89b4fa", -- Blue
  },
  NvimTreeFolderArrowClosed = {
    fg = "#bac2de", -- Grey foreground
  },
  NvimTreeFolderArrowOpen = {
    fg = "#bac2de", -- Grey foreground
  },
  NvimTreeIndentMarker = {
    fg = "#6c7086", -- Grey
  },
  NvimTreeWinSeparator = {
    fg = "#1a2332",
    bg = "NONE",
  },
}

return M