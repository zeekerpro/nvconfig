-- overriding default plugin configs!

local M = {
  ["kyazdani42/nvim-tree.lua"] = require "custom.plugins.override.nvimtree",
  ["nvim-treesitter/nvim-treesitter"] = require "custom.plugins.override.treesitter",
  ["lukas-reineke/indent-blankline.nvim"] = require "custom.plugins.override.blankline",
  ["nvim-telescope/telescope.nvim"] = require "custom.plugins.override.telescope",
  ["akinsho/bufferline.nvim"] = require "custom.plugins.override.bufferline",
}

return M
