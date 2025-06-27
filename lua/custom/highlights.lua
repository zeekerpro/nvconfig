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
    fg = "light_grey",
  },
  -- Better visual separators
  StatusLine = {
    bg = "#0f1419",  -- Darker than terminal bg
    fg = "light_grey",
  },
  -- Improve fold colors
  Folded = {
    bg = "#1a2332",
    fg = "light_grey",
  },
  -- Better search highlighting
  Search = {
    bg = "sun",
    fg = "black",
  },
  IncSearch = {
    bg = "nord_blue",
    fg = "black",
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
  -- Enhanced floating window colors
  NormalFloat = {
    bg = "#0f1419",  -- Darker than terminal bg for contrast
    fg = "white",
  },
  FloatBorder = {
    bg = "#0f1419",
    fg = "grey_fg",
  },
  -- Popup menu colors
  Pmenu = {
    bg = "#0f1419",
    fg = "white",
  },
  PmenuSel = {
    bg = "#1a2332",
    fg = "white",
  },
  -- Better line numbers
  LineNr = {
    fg = "grey",
  },
  CursorLineNr = {
    fg = "white",
    bold = true,
  },
  -- NvimTree with transparency support
  NvimTreeNormal = {
    bg = "NONE",  -- Let it be transparent
    fg = "white",
  },
  NvimTreeFolderIcon = {
    fg = "blue",
  },
  NvimTreeFolderArrowClosed = {
    fg = "grey_fg",
  },
  NvimTreeFolderArrowOpen = {
    fg = "grey_fg",
  },
  NvimTreeIndentMarker = {
    fg = "grey",
  },
  NvimTreeWinSeparator = {
    fg = "#1a2332",
    bg = "NONE",
  },
}

return M