-- Custom configuration entry point for NvChad v2.5

-- Set leader key
vim.g.mapleader = ";"

-- Load custom options
require "custom.core.options"

-- Setup custom UI to replace NvChad/ui
require("custom.configs.ui").setup()

-- Force apply custom highlights
require("custom.configs.force_highlights").setup()

