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

-- Load custom configuration early
pcall(require, "custom")

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
  
  -- Load custom post-init (theme, additional setup)
  pcall(require, "custom.post_init")
end)