-- Custom UI replacement for NvChad/ui
local M = {}

-- Mock nvchad modules to prevent errors
M.setup = function()
  -- Create a mock tabufline module
  package.loaded["nvchad.tabufline"] = {
    close_buffer = function()
      local buf = vim.api.nvim_get_current_buf()
      if vim.bo[buf].modified then
        vim.cmd("confirm bdelete")
      else
        vim.cmd("bdelete")
      end
    end,
    buf_index = function() return 1 end,
    setup = function() end,
  }
  
  -- Create a mock term module
  package.loaded["nvchad.term"] = {
    new = function(opts)
      -- Do nothing since we don't want terminal functionality
    end,
    toggle = function(opts)
      -- Do nothing since we don't want terminal functionality
    end,
  }
end

return M