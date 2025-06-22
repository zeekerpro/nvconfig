local opt = vim.opt
local g = vim.g

-- Leader key is set in init.lua

-- GitHub Copilot setting
g.copilot_assume_mapped = true

-- Auto-delete trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

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