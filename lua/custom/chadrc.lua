-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.options = {
  user = function ()
    require "custom.core.options"
  end
}

M.plugins = {
  remove = {
    "NvChad/nvterm",
    'lewis6991/gitsigns.nvim',
  },
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.configs.lspconfig",
    },
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
