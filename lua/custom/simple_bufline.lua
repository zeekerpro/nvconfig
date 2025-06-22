-- Simple buffer line replacement for NvChad v2.5
local M = {}

-- Setup simple buffer navigation
M.setup = function()
  -- Show buffer tabs
  vim.opt.showtabline = 2
  
  -- Simple buffer switching mappings (already in custom mappings)
  -- <Tab> and <S-Tab> for buffer switching
  -- <leader>x for closing buffer
  
  -- Optional: Show buffer numbers in statusline
  vim.opt.laststatus = 2
end

return M