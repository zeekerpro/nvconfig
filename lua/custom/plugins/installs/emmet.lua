local M = {}

local g = vim.g

M.setup = function ()
  g.user_emmet_mode = 'iv'
  g.user_emmet_install_global = 1
  g.user_emmet_install_command = 0
  g.user_emmet_complete_tag = 0
end

return M
