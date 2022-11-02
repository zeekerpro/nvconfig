local M = {}

local g = vim.g

M.setup = function ()
  g.user_emmet_mode = 'i'
  g.user_emmet_install_global = 0
  g.user_emmet_install_command = 0
  g.user_emmet_complete_tag = 0
end

M.config = function ()
  vim.api.nvim_command('EmmetInstall')
end




return M
