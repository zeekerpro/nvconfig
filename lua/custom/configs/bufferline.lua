-- Bufferline configuration for VSCode-like tabs
return {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    themable = true,
    numbers = "none",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    
    -- Tab styling
    indicator = {
      icon = "▎", -- this should be omitted if indicator style is not 'icon'
      style = "icon",
    },
    buffer_close_icon = "󰅖",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    
    -- Layout
    max_name_length = 30,
    max_prefix_length = 30,
    truncate_names = true,
    tab_size = 21,
    diagnostics = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        separator = true,
      }
    },
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    show_duplicate_prefix = true,
    persist_buffer_sort = true,
    
    -- Separator style
    separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' }
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    hover = {
      enabled = true,
      delay = 200,
      reveal = {'close'}
    },
    sort_by = 'insert_after_current',
  },
  
  highlights = {
    fill = {
      bg = "#141b26", -- Match terminal background
    },
    background = {
      fg = "#6b7280",
      bg = "#0f1419",
    },
    buffer_selected = {
      fg = "#ffffff",
      bg = "#1a2332",
      bold = true,
      italic = false,
    },
    buffer_visible = {
      fg = "#9ca3af",
      bg = "#111827",
    },
    close_button = {
      fg = "#6b7280",
      bg = "#0f1419",
    },
    close_button_visible = {
      fg = "#9ca3af",
      bg = "#111827",
    },
    close_button_selected = {
      fg = "#ef4444",
      bg = "#1a2332",
    },
    tab_close = {
      fg = "#ef4444",
      bg = "#141b26",
    },
    indicator_selected = {
      fg = "#3b82f6",
      bg = "#1a2332",
    },
    modified = {
      fg = "#f59e0b",
      bg = "#0f1419",
    },
    modified_visible = {
      fg = "#f59e0b",
      bg = "#111827",
    },
    modified_selected = {
      fg = "#10b981",
      bg = "#1a2332",
    },
    separator = {
      fg = "#141b26",
      bg = "#0f1419",
    },
    separator_selected = {
      fg = "#141b26",
      bg = "#1a2332",
    },
    separator_visible = {
      fg = "#141b26",
      bg = "#111827",
    },
  },
}