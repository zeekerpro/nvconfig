-- overriding default plugin configs!

local M = {
  ["nvim-tree/nvim-tree.lua"] = require "custom.plugins.overrides.nvimtree",
  ["nvim-treesitter/nvim-treesitter"] = require "custom.plugins.overrides.treesitter",
  ["lukas-reineke/indent-blankline.nvim"] = require "custom.plugins.overrides.blankline",
  ["nvim-telescope/telescope.nvim"] = require "custom.plugins.overrides.telescope",
  ["akinsho/bufferline.nvim"] = require "custom.plugins.overrides.bufferline",
  ["williamboman/mason.nvim"] = require "custom.plugins.overrides.mason",
}

return M
