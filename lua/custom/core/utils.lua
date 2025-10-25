-- Utility functions for custom mappings and operations
local M = {}

-- Load base46 cache file if it exists
-- This reduces code duplication across multiple plugin configurations
---@param cache_name string The name of the cache file (e.g., "devicons", "nvimtree")
---@return nil
M.load_cache = function(cache_name)
  local cache_file = vim.g.base46_cache .. cache_name
  if vim.loop.fs_stat(cache_file) then
    dofile(cache_file)
  end
end

-- Smart close buffer with the following behavior:
-- 1. Close any associated auxiliary windows (like outline)
-- 2. Check if the buffer has unsaved changes
-- 3. Prompt for confirmation if modified, otherwise close directly
M.smart_close_buffer = function()
  -- Close outline window if it's open (ignore errors if not open)
  pcall(vim.cmd, "OutlineClose")

  -- Get current buffer
  local buf = vim.api.nvim_get_current_buf()

  -- Check if buffer has unsaved modifications
  if vim.bo[buf].modified then
    -- Has modifications: prompt user for confirmation
    vim.cmd("confirm bdelete")
  else
    -- No modifications: close directly
    vim.cmd("bdelete")
  end
end

-- Close all buffers except the current one
-- Prompts for confirmation if any buffers have unsaved changes
M.close_all_buffers = function()
  vim.cmd("confirm %bd|e#")
end

-- Additional utility functions can be added here as needed
-- For example:
--   - Smart window navigation
--   - Custom file operations
--   - Project-specific helpers

return M
