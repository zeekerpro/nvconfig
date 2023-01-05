-- Just an example, supposed to be placed in /lua/custom/

local M = {}

local plugins = require "custom.plugins"

M.plugins = plugins

M.mappings = require "custom.core.mappings"

M.ui = {
  theme = "nightfox",
  -- theme = "blossom",
  theme_toggle = {
    "chadtain",
    "onedark"
  },
  transparency = true,
}

return M
