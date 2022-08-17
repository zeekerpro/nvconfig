local symbols_outline = require "symbols_outline"

local M = {}

M.setup = function ()
  symbols_outline.setup {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    position = 'right',
    width = 30,
    keymaps = {
      close = 'q',
      goto_location = '<CR>',
      focus_location = 'o',
      hover_symbol = 'K',
      toggle_preview = 'p',
      rename_symbol = 'r',
      code_actions = 'a',
    },
    lsp_blacklist = {},
  }
end

return M
