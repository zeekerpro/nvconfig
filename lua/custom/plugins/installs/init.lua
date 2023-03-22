return {

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- Automated session manager for Neovim
  {
    'rmagatti/auto-session',
    lazy = false,
    config = function ()
      local present, auto_session = pcall(require, 'auto-session')
      if present then
        local conf = require  "custom.plugins.installs.auto_session"
        auto_session.setup(conf)
      end
    end
  },

  {
    'simrat39/symbols-outline.nvim',
    config = function ()
      local present, symbols_outline = pcall(require, "symbols-outline")
      if present then
        local conf = require('custom.plugins.installs.symbols-outline')
        symbols_outline.setup(conf)
      end
    end
  },

  {
    'tpope/vim-rails',
    ft = {'rb', 'ruby'}
  },

  { 'editorconfig/editorconfig-vim' },

  {
    'mattn/emmet-vim',
    -- event = {"InsertEnter", "FileType"},
    ft = {
      "html", "css", "vue",
      "javascript", "javascriptreact",
      "svelte", "wxml", "wxss", "scss", "sass", "erb"
    },
    setup = function ()
      require("custom.plugins.installs.emmet").setup()
    end,
    -- config = 'vim.cmd[[EmmetInstall]]'
    cmd = {'EmmetInstall'}
  },

  {
    'mbbill/undotree',
    cmd = {'UndotreeToggle'}
  },

  {
    'chemzqm/wxapp.vim',
    ft = {"wxss", "wxml"}
  },

  {
    'Exafunction/codeium.vim',
    lazy = false
  }

}

