local M = { }

local winwidth = 30

local toggle_width = function(_)
  local max = 0
  local line_count = vim.fn.line('$')

  for i=1, line_count do
    local txt = vim.fn.substitute(vim.fn.getline(i), '\\s\\+$', '', '')
    max = math.max(vim.fn.strdisplaywidth(txt) + 2, max)
  end

  local cur_width = vim.fn.winwidth(0)
  local half = math.floor((winwidth + (max - winwidth) / 2) + 0.5)
  local new_width = winwidth
  if cur_width == winwidth then
    new_width = half
  elseif cur_width == half then
    new_width = max
  else
    new_width = winwidth
  end
  vim.cmd(new_width .. ' wincmd |')
end


M.git = {
  enable = true,
}

M.renderer = {
  highlight_git = true,
  icons = {
    show = {
      git = true,
      folder_arrow = false,
    },
  },
}

M.actions = {
  open_file = {
     -- quit_on_open = true
  }
}

M.view = {
  width = winwidth,
  side = "left",
  mappings = {
    list = {
      { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
      { key = "<C-e>",                          action = "edit_in_place" },
      { key = "O",                              action = "edit_no_picker" },
      { key = { "<C-]>", "<2-RightMouse>" },    action = "cd" },
      { key = "<C-v>",                          action = "vsplit" },
      { key = "<C-x>",                          action = "split" },
      { key = "<C-t>",                          action = "tabnew" },
      { key = "<",                              action = "prev_sibling" },
      { key = ">",                              action = "next_sibling" },
      { key = "P",                              action = "parent_node" },
      { key = "<BS>",                           action = "close_node" },
      { key = "<Tab>",                          action = "preview" },
      { key = "K",                              action = "first_sibling" },
      { key = "J",                              action = "last_sibling" },
      { key = "I",                              action = "toggle_git_ignored" },
      { key = "H",                              action = "toggle_dotfiles" },
      { key = "U",                              action = "toggle_custom" },
      { key = "R",                              action = "refresh" },
      { key = "a",                              action = "create" },
      { key = "d",                              action = "remove" },
      { key = "D",                              action = "trash" },
      { key = "r",                              action = "rename" },
      { key = "<C-r>",                          action = "full_rename" },
      { key = "x",                              action = "cut" },
      { key = "c",                              action = "copy" },
      { key = "p",                              action = "paste" },
      { key = "y",                              action = "copy_name" },
      { key = "Y",                              action = "copy_path" },
      { key = "gy",                             action = "copy_absolute_path" },
      { key = "[c",                             action = "prev_git_item" },
      { key = "]c",                             action = "next_git_item" },
      { key = "-",                              action = "dir_up" },
      { key = "s",                              action = "system_open" },
      { key = "f",                              action = "live_filter" },
      { key = "F",                              action = "clear_live_filter" },
      { key = "q",                              action = "close" },
      { key = "W",                              action = "collapse_all" },
      { key = "E",                              action = "expand_all" },
      { key = "S",                              action = "search_node" },
      { key = ".",                              action = "run_file_command" },
      { key = "<C-k>",                          action = "toggle_file_info" },
      { key = "g?",                             action = "toggle_help" },
      -- custom add
      { key = "h",                              action = "close_node"},
      { key = "l",                              action = "edit" },
      {
        key = 'w',
        action = 'toggle_width',
        action_cb = toggle_width
      },
    }
  }
}

return M
