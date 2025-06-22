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

-- Keep cursor centered vertically on the screen
opt.scrolloff = 999

-- Indentation settings
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = false