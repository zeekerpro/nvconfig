---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  -- theme = "onedark",
  theme = "nightfox",
  theme_toggle = { "onedark", "one_light", "nightfox" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.core.mappings"

return M
