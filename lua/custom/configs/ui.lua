-- Custom UI replacement for NvChad/ui
-- Provides minimal mock modules to prevent errors from code expecting NvChad UI
local M = {}

-- Setup minimal UI module mocks
M.setup = function()
  -- Mock tabufline module (only the essential close_buffer function is needed)
  package.loaded["nvchad.tabufline"] = {
    close_buffer = function()
      -- Use bufferline's buffer close functionality
      local buf = vim.api.nvim_get_current_buf()
      if vim.bo[buf].modified then
        vim.cmd("confirm bdelete")
      else
        vim.cmd("bdelete")
      end
    end,
  }

  -- Note: Terminal functionality (nvchad.term) is not mocked
  -- because this configuration doesn't use NvChad's terminal features
end

return M
