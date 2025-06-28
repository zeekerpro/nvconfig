-- Force apply custom highlights
local M = {}

M.apply_highlights = function()
  local highlights = require("custom.highlights")
  
  -- Apply override highlights
  for group, settings in pairs(highlights.override) do
    vim.api.nvim_set_hl(0, group, settings)
  end
  
  -- Apply additional highlights
  for group, settings in pairs(highlights.add) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

M.setup = function()
  -- Apply highlights immediately
  M.apply_highlights()
  
  -- Reapply after colorscheme changes
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      vim.schedule(function()
        M.apply_highlights()
      end)
    end,
  })
  
  -- Also apply after plugins are loaded
  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyDone",
    callback = function()
      vim.schedule(function()
        M.apply_highlights()
      end)
    end,
  })
  
  -- Force apply after a delay to ensure everything is loaded
  vim.defer_fn(function()
    M.apply_highlights()
  end, 1000)
end

return M