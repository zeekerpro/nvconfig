-- Custom highlight overrides and additions
-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local colors = require("custom.configs.colors")
local c = colors.semantic
local cp = colors.catppuccin
local ts = colors.treesitter

local M = {}

---@type HLTable
M.override = {
  -- Don't override Normal here - let transparency work
  -- Background is handled by autocmd in options.lua
  CursorLine = {
    bg = c.cursor_line,
  },
  Comment = {
    italic = true,
    fg = c.comment,
  },

  -- Enhanced syntax highlighting for more vibrant colors
  Keyword = {
    fg = c.keyword,
    bold = true,
  },
  Function = {
    fg = c.func,
    bold = true,
  },
  String = {
    fg = c.string,
  },
  Number = {
    fg = c.number,
  },
  Boolean = {
    fg = c.bool,
  },
  Type = {
    fg = c.type,
    bold = true,
  },
  Constant = {
    fg = c.constant,
  },
  Variable = {
    fg = c.variable,
  },
  Operator = {
    fg = c.operator,
  },
  Special = {
    fg = cp.flamingo,
  },
  PreProc = {
    fg = cp.teal,
  },
  Identifier = {
    fg = cp.text,
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
    bg = c.cursor_line,
    fg = cp.subtext1,
  },
  -- Better search highlighting
  Search = {
    bg = cp.yellow,
    fg = cp.base,
  },
  IncSearch = {
    bg = cp.blue,
    fg = cp.base,
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
  ["@keyword"] = { fg = ts.keyword, bold = true },
  ["@function"] = { fg = ts.func, bold = true },
  ["@function.call"] = { fg = ts.func },
  ["@method"] = { fg = ts.func, bold = true },
  ["@method.call"] = { fg = ts.func },
  ["@string"] = { fg = ts.string },
  ["@string.regex"] = { fg = ts.type },
  ["@number"] = { fg = ts.number },
  ["@boolean"] = { fg = ts.boolean },
  ["@type"] = { fg = ts.type, bold = true },
  ["@type.builtin"] = { fg = ts.type_builtin },
  ["@constant"] = { fg = ts.constant },
  ["@constant.builtin"] = { fg = ts.constant_builtin, bold = true },
  ["@variable"] = { fg = ts.variable },
  ["@variable.builtin"] = { fg = ts.variable_builtin },
  ["@operator"] = { fg = ts.operator },
  ["@punctuation"] = { fg = ts.punctuation },
  ["@punctuation.bracket"] = { fg = cp.cyan },
  ["@comment"] = { fg = c.comment, italic = true },
  ["@tag"] = { fg = ts.tag },
  ["@tag.attribute"] = { fg = ts.attribute },
  ["@property"] = { fg = ts.property },
  ["@parameter"] = { fg = ts.parameter, italic = true },
  ["@field"] = { fg = ts.field },
  ["@namespace"] = { fg = ts.namespace },
  ["@include"] = { fg = cp.teal },
  ["@conditional"] = { fg = ts.keyword, bold = true },
  ["@repeat"] = { fg = ts.keyword, bold = true },
  ["@exception"] = { fg = cp.red, bold = true },
  -- Enhanced floating window colors
  NormalFloat = {
    bg = "#0f1419",
    fg = cp.text,
  },
  FloatBorder = {
    bg = "#0f1419",
    fg = cp.subtext1,
  },
  -- Popup menu colors
  Pmenu = {
    bg = c.pmenu_bg,
    fg = cp.text,
  },
  PmenuSel = {
    bg = c.pmenu_sel,
    fg = cp.text,
  },
  -- Better line numbers
  LineNr = {
    fg = cp.overlay0,
  },
  CursorLineNr = {
    fg = cp.text,
    bold = true,
  },
  -- NvimTree with transparency support
  NvimTreeNormal = {
    bg = "NONE",
    fg = cp.text,
  },
  NvimTreeFolderIcon = {
    fg = cp.blue,
  },
  NvimTreeFolderArrowClosed = {
    fg = cp.subtext1,
  },
  NvimTreeFolderArrowOpen = {
    fg = cp.subtext1,
  },
  NvimTreeIndentMarker = {
    fg = cp.overlay0,
  },
  NvimTreeWinSeparator = {
    fg = c.cursor_line,
    bg = "NONE",
  },
  -- Outline window separator
  WinSeparator = {
    fg = cp.subtext1,
    bg = "NONE",
  },
}

return M
