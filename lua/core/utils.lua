-- Compatibility layer for core.utils (v2.0 -> v2.5)
local M = {}

-- Default configuration for NvChad UI
local default_config = {
  ui = {
    cmp = {
      icons = true,
      lspkind_text = true,
      style = "default",
      border_color = "",
      selected_item_bg = "colored",
    },
    telescope = { style = "borderless" },
    statusline = {
      theme = "default",
      separator_style = "default",
      overriden_modules = nil,
      lspprogress_len = 25,
    },
    tabufline = {
      enabled = false,  -- Disable to avoid loading issues
      lazyload = false,
      overriden_modules = nil,
      show_numbers = false,
    },
    nvdash = {
      load_on_startup = false,
      header = {
        "           ▄ ▄                   ",
        "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
        "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
        "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
        "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
        "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
        "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
        "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
        "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
      },
      buttons = {
        { "  Find File", "f f", "Telescope find_files" },
        { "󰈚  Recent Files", "f o", "Telescope oldfiles" },
        { "󰈭  Find Word", "f w", "Telescope live_grep" },
        { "  Bookmarks", "m a", "Telescope marks" },
        { "  Themes", "t h", "Telescope themes" },
        { "  Mappings", "c h", "NvCheatsheet" },
      },
    },
    cheatsheet = { theme = "grid" },
    lsp = {
      signature = {
        disabled = false,
        silent = true,
      },
    },
    theme = "onedark",
    theme_toggle = { "onedark", "one_light" },
    transparency = true,
    lsp_semantic_tokens = false,
  },
}

-- Load config function that merges user config with defaults
M.load_config = function()
  local ok, user_config = pcall(require, "chadrc")
  if ok then
    return vim.tbl_deep_extend("force", default_config, user_config)
  else
    return default_config
  end
end

-- Lazy loading function (basic implementation)
M.lazy_load = function(tb)
  return function()
    local lazy_plugin = tb or {}
    return lazy_plugin
  end
end

-- Load override function
M.load_override = function(default_table, override_table)
  local result = vim.tbl_deep_extend("force", default_table, override_table or {})
  return result
end

-- Simple merge function
M.merge = function(t1, t2)
  return vim.tbl_deep_extend("force", t1, t2 or {})
end

-- Parse table function
M.parse_table = function(content, override)
  return M.load_override(content, override)
end

-- Load mappings function for NvChad compatibility
M.load_mappings = function(section, mapping_opt)
  -- Try to load custom mappings first
  local ok, custom_mappings = pcall(require, "custom.core.mappings")
  if ok and custom_mappings[section] then
    -- Apply custom mappings for the section
    local function apply_mappings(mapping_table)
      for mode, mode_mappings in pairs(mapping_table) do
        for key, mapping in pairs(mode_mappings) do
          if type(mapping) == "table" and mapping[1] then
            local cmd = mapping[1]
            local desc = mapping[2] or ""
            local opts = mapping.opts or {}
            opts.desc = desc
            vim.keymap.set(mode, key, cmd, opts)
          end
        end
      end
    end
    
    apply_mappings(custom_mappings[section])
  end
end

return M