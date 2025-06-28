-- Custom nvimtree configuration with optimized icons
local cache_file = vim.g.base46_cache .. "nvimtree"
if vim.loop.fs_stat(cache_file) then
  dofile(cache_file)
end

return {
  filters = { dotfiles = false },
  disable_netrw = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    width = 30,
    adaptive_size = true,
    centralize_selection = true,
    preserve_window_proportions = true,
  },
  
  actions = {
    open_file = {
      resize_window = true,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = { ".git", "target", "build" },
    },
  },
  
  -- Custom key mappings
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')
    
    -- Default mappings
    api.config.mappings.default_on_attach(bufnr)
    
    -- Custom mappings
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    
    -- Override h and l mappings (no need to delete first)
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  end,
  renderer = {
    root_folder_label = ":t",
    highlight_git = true,
    indent_markers = { 
      enable = true,
      inline_arrows = true,
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        modified = "●",
        folder = {
          arrow_closed = "▸",  -- 细小箭头
          arrow_open = "▾",    -- 细小箭头
          default = "",      -- 简洁文件夹图标
          open = "",        -- 简洁打开文件夹图标
          empty = "",       -- 简洁空文件夹图标
          empty_open = "",  -- 简洁空打开文件夹图标
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌"
        },
      },
    },
  },
}