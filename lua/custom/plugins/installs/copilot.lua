-- https://github.com/zbirenbaum/copilot.lua


local M = {
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 80,
    keymap = {
      accept = "<C-k>",
      accept_word = false,
      accept_line = false,
      next = "<C-h>",
      prev = "<C-l>",
      dismiss = "<C-x>",
    },
  },
  panel = {
    enabled = true,
    layout = {
      position = "right",
      ratio = 0.6
    },
    keymap = {
      jump_prev = "<C-h>",
      jump_next = "<C-l>",
      accept = "<CR>",
      refresh = "gr",
      open = "<C-j>"
    },
  },
}

return M

