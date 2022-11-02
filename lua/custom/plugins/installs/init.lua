return {

  -- we are just modifying lspconfig's packer definition table
  ["neovim/nvim-lspconfig"] = {
    config = function()
      -- require "plugins.install.configs.lspconfig"
      require "custom.plugins.installs.configs.lspconfig"
    end,
  },

  -- Automated session manager for Neovim
  ['rmagatti/auto-session'] = {
    config = function ()
      local present, auto_session = pcall(require, 'auto-session')
      if present then
        local conf = require  "custom.plugins.installs.configs.auto_session"
        auto_session.setup(conf)
      end
    end
  },

  ['simrat39/symbols-outline.nvim'] = {
    config = function ()
      local present, symbols_outline = pcall(require, "symbols-outline")
      if present then
        local conf = require('custom.plugins.installs.configs.symbols-outline')
        symbols_outline.setup(conf)
      end
    end
  },

  ['tpope/vim-rails'] = {
    ft = {'rb', 'ruby'}
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.installs.configs.null-ls").setup()
    end,
  },

  ['editorconfig/editorconfig-vim'] = {},

  ['mattn/emmet-vim'] = {
    -- event = {"InsertEnter", "FileType"},
    ft = { "html", "css", "vue", "javascript", "javascriptreact", "svelte", "wxml", "wxss", "scss", "sass" },
    setup = function ()
      require("custom.plugins.installs.configs.emmet").setup()
    end,
    config = function ()
      require("custom.plugins.installs.configs.emmet").config()
    end
  },

  ['mbbill/undotree'] = {
    cmd = {'UndotreeToggle'}
  },

  ['chemzqm/wxapp.vim'] = {
    ft = {"wxss", "wxml"}
  }

}
