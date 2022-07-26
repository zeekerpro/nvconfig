-- Just an example, supposed to be placed in /lua/custom/

local M = {}

M.plugins = {
  remove = {
    "NvChad/nvterm",
    'lewis6991/gitsigns.nvim',
  },
  user = require "custom.plugins",
  override = require "custom.plugins.override",
}

M.mappings = require "custom.core.mappings"

M.ui = {
  theme = "nightfox",
  -- theme = "blossom",
  theme_toggle = {
    "chadtain",
    "onedark"
  },
  -- transparency = true,
}

return M
