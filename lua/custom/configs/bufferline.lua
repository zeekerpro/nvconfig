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
    
    -- Tab styling with smaller icons
    indicator = {
      icon = "▏", -- thinner indicator line
      style = "icon",
    },
    buffer_close_icon = "×",
    modified_icon = "•",
    close_icon = "×",
    left_trunc_marker = "‹",
    right_trunc_marker = "›",
    
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
      fg = "#8B949E",
      bg = "#21262D",
    },
    buffer_selected = {
      fg = "#cdd6f4",
      bg = "#1e1e2e", -- Match editor background
      bold = true,
      italic = false,
    },
    buffer_visible = {
      fg = "#C9D1D9",
      bg = "#30363D",
    },
    close_button = {
      fg = "#8B949E",
      bg = "#21262D",
    },
    close_button_visible = {
      fg = "#C9D1D9",
      bg = "#30363D",
    },
    close_button_selected = {
      fg = "#f38ba8",
      bg = "#1e1e2e", -- Match editor background
      bold = true,
    },
    tab_close = {
      fg = "#F85149",
      bg = "#141b26",
    },
    indicator_selected = {
      fg = "#89b4fa",
      bg = "#1e1e2e", -- Match editor background
    },
    modified = {
      fg = "#D29922",
      bg = "#21262D",
    },
    modified_visible = {
      fg = "#F2CC60",
      bg = "#30363D",
    },
    modified_selected = {
      fg = "#a6e3a1",
      bg = "#1e1e2e", -- Match editor background
      bold = true,
    },
    separator = {
      fg = "#141b26",
      bg = "#21262D",
    },
    separator_selected = {
      fg = "#1e1e2e",
      bg = "#1e1e2e", -- Match editor background
    },
    separator_visible = {
      fg = "#141b26",
      bg = "#30363D",
    },
    -- Additional colorful highlights
    duplicate_selected = {
      fg = "#cdd6f4",
      bg = "#1e1e2e", -- Match editor background
      italic = true,
    },
    duplicate_visible = {
      fg = "#C9D1D9",
      bg = "#30363D",
      italic = true,
    },
    duplicate = {
      fg = "#8B949E",
      bg = "#21262D",
      italic = true,
    },
    numbers = {
      fg = "#79C0FF",
      bg = "#21262D",
    },
    numbers_visible = {
      fg = "#79C0FF",
      bg = "#30363D",
    },
    numbers_selected = {
      fg = "#cdd6f4",
      bg = "#1e1e2e", -- Match editor background
      bold = true,
    },
  },
}