return {

  -- we are just modifying lspconfig's packer definition table
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },

  -- Automated session manager for Neovim
  ['rmagatti/auto-session'] = {
    config = function ()
      local present, auto_session = pcall(require, 'auto-session')
      if present then
        auto_session.setup( {
          log_level = 'info',
          auto_session_suppress_dirs = {'~/', '~/Projects'}
        })
      end
    end
  },

  ['simrat39/symbols-outline.nvim'] = {
    config = function ()
      local present, symbols_outline = pcall(require, "symbols-outline")
      if present then
        local conf = require('custom.plugins.configs.symbols-outline')
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
      require("custom.plugins.configs.null-ls").setup()
    end,
  },

  ['editorconfig/editorconfig-vim'] = {},

  ['mattn/emmet-vim'] = {
    event = {"InsertEnter"},
    ft = { "html", "css", "vue", "javascript", "javascriptreact", "svelte" },
    setup = function ()
      require("custom.plugins.configs.emmet").setup()
    end
  },

  ['mbbill/undotree'] = {
    cmd = {'UndotreeToggle'}
  },

  ['chemzqm/wxapp.vim'] = {}

}
