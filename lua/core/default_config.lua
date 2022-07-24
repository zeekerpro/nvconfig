-- Chadrc overrides this file

local M = {}

M.options = {
  -- load your options here or load module with options
  user = function() end,

   nvChad = {
      update_url = "https://github.com/zeekerpro/nvconfig.git",
      update_branch = "main",
   },
}

M.ui = {
  -- hl = highlights
  hl_add = {},
  hl_override = {},
  changed_themes = {},
  theme_toggle = { "onedark", "one_light" },
  theme = "onedark", -- default theme
  transparency = false,
}

M.plugins = {
  override = {},
  remove = {},
  user = {},
}

-- check core.mappings for table structure
M.mappings = require "core.mappings"

return M
