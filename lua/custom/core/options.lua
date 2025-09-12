local opt = vim.opt
local o = vim.o
local g = vim.g

-- Leader key is set in init.lua

-- GitHub Copilot setting
g.copilot_assume_mapped = true

-- Enhanced visual options (from nvchad/options.lua customizations)
-- Enable true colors for better color consistency
o.termguicolors = true

-- Consolidated autocmds for better performance
local autocmd_group = vim.api.nvim_create_augroup("CustomOptions", { clear = true })

-- Smart background handling for transparency and auto-cleanup
vim.api.nvim_create_autocmd("ColorScheme", {
  group = autocmd_group,
  pattern = "*",
  callback = function()
    -- Check if transparency is enabled
    local config = require("core.utils").load_config()
    if config.ui and config.ui.transparency then
      -- When transparency is enabled, don't set background
      vim.api.nvim_set_hl(0, "Normal", { fg = "#ffffff" })
      vim.api.nvim_set_hl(0, "NormalNC", { fg = "#ffffff" })
    else
      -- When transparency is disabled, set background color
      vim.api.nvim_set_hl(0, "Normal", { bg = "#141b26", fg = "#ffffff" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "#141b26", fg = "#ffffff" })
    end
  end,
})


-- Better visual feedback
o.cmdheight = 1
o.conceallevel = 0
o.pumheight = 10
o.showtabline = 2
o.smarttab = true
o.wrap = false

-- Enhanced visual elements
o.relativenumber = false
o.scrolloff = 8
o.sidescrolloff = 8

-- Code folding
opt.foldmethod = "indent"
opt.foldlevel = 50

-- Disable swapfile
opt.swapfile = false

-- Better scroll behavior (was too extreme with 999)
opt.scrolloff = 8

-- Indentation settings
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = false

-- Enhanced visual settings for better appearance
opt.list = true
opt.listchars = {
  tab = "→ ",
  trail = "·",
  extends = "◣",
  precedes = "◢",
  nbsp = "○"
}

-- Better completion experience
opt.completeopt = "menu,menuone,noselect"
opt.shortmess:append("c")

-- Improve search experience
opt.hlsearch = true
opt.incsearch = true

-- Better window behavior
opt.splitbelow = true
opt.splitright = true