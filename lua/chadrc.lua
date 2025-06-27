---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "catppuccin", -- More visually appealing theme
  theme_toggle = { "catppuccin", "github_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  transparency = true, -- Enable transparency for see-through effect
  
  -- Enhanced statusline
  statusline = {
    theme = "vscode_colored",
    separator_style = "round",
  },
  
  -- Disable NvChad tabufline, use bufferline.nvim instead
  tabufline = {
    enabled = false,
    show_numbers = false,
  },
  
  -- Telescope styling
  telescope = {
    style = "bordered",
  },
  
  -- Better completion menu styling  
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom_colored",
    border_color = "grey_fg",
    selected_item_bg = "colored",
  },
}

return M