local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting

local sources = {
  -- Lua
   formatting.stylua,
}

local M = {}

M.setup = function()
   null_ls.setup {
      -- debug = true,
      sources = sources,
   }
end

return M
