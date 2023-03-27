-- https://github.com/zbirenbaum/copilot.lua


local M = {
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 80,
    keymap = {
      accept = "<C-l>",
      accept_word = false,
      accept_line = false,
      next = "<C-j>",
      prev = "<C-k>",
      dismiss = "<C-h>",
    },
  },
  panel = {
    enabled = true,
    layout = {
      position = "right",
      ratio = 0.8
    },
    keymap = {
      jump_prev = "<C-k>",
      jump_next = "<C-j>",
      accept = "<CR>",
      refresh = "gr",
      open = "<C-CR>"
    },
  },
}

return M

