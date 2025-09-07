-- Custom post-initialization for themes and additional setup
local M = {}

-- Optimized theme initialization
M.setup_theme = function()
  -- Load user config from chadrc
  local config = require("core.utils").load_config()
  
  -- Try to load base46 theme system
  local theme_loaded = pcall(function()
    local base46 = require("base46")
    if config.ui and config.ui.theme then
      base46.load_theme(config.ui.theme)
    end
    base46.load_all_highlights()
  end)
  
  if theme_loaded then
    -- Apply custom highlights after theme loads
    local highlights_ok, custom_highlights = pcall(require, "custom.highlights")
    if highlights_ok then
      -- Apply override highlights
      for group, settings in pairs(custom_highlights.override or {}) do
        vim.api.nvim_set_hl(0, group, settings)
      end
      
      -- Apply additional highlights
      for group, settings in pairs(custom_highlights.add or {}) do
        vim.api.nvim_set_hl(0, group, settings)
      end
    end
  else
    -- Fallback to good default colorschemes
    local fallback_schemes = { "habamax", "slate", "desert", "default" }
    for _, scheme in ipairs(fallback_schemes) do
      if pcall(vim.cmd, "colorscheme " .. scheme) then
        break
      end
    end
  end
end

-- Main initialization
M.setup_theme()

return M