-- Simplified highlight management (integrated with post_init.lua)
local M = {}

M.apply_highlights = function()
  local highlights_ok, highlights = pcall(require, "custom.highlights")
  if not highlights_ok then return end
  
  -- Apply override highlights
  for group, settings in pairs(highlights.override or {}) do
    vim.api.nvim_set_hl(0, group, settings)
  end
  
  -- Apply additional highlights
  for group, settings in pairs(highlights.add or {}) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

M.setup = function()
  -- Only reapply on colorscheme changes (initial load handled by post_init.lua)
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      vim.schedule(function()
        M.apply_highlights()
      end)
    end,
  })
end

return M