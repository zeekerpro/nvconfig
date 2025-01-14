local opt = vim.opt

local g = vim.g

g.mapleader = ";"

-- https://www.reddit.com/r/neovim/comments/wbx4r6/has_anyone_managed_to_use_github_copilot_in_nvchad/
g.copilot_assume_mapped = true

-- 自动删除行尾空格
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- 代码折叠
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldmethod = "indent"
opt.foldlevel = 50

-- disable swapfile
opt.swapfile = false

-- keep cursor centered vertically on the screen
opt.scrolloff=999

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = false
