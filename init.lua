-- NvChad v2.5 init file
vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46_cache/"

-- Bootstrap lazy.nvim first
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Load core NvChad first
require "nvchad.options"
require "nvchad.autocmds"

-- Setup lazy.nvim
require("lazy").setup("nvchad.plugins", {
  defaults = { lazy = true },
  checker = { enabled = false },
  change_detection = {
    enabled = true,
    notify = false,
  },
  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
})

-- Load mappings after plugins
vim.schedule(function()
  require "nvchad.mappings"
  
  -- Initialize theme with safe fallback
  local function setup_theme()
    -- Just set a basic colorscheme for now to avoid base46 issues
    local ok, _ = pcall(vim.cmd, "colorscheme default")
    if not ok then
      vim.notify("Using fallback colorscheme", vim.log.levels.INFO)
    end
    
    -- Try to load base46 if available, but don't fail if it doesn't work
    pcall(function()
      local base46 = require("base46")
      base46.load_all_highlights()
      vim.cmd("colorscheme nvchad")
    end)
  end
  
  setup_theme()
  
  -- Setup simple buffer management instead of tabufline
  pcall(function()
    require("custom.simple_bufline").setup()
  end)
end)