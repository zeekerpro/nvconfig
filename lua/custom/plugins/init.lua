return {

  -- Automated session manager for Neovim
  ['rmagatti/auto-session'] = {
    after = "base46",
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
    after = "base46",
    config = function ()
      require 'custom.plugins.configs.symbols-outline'
    end
  },

  ['tpope/vim-rails'] = {
    after = "base46",
    ft = {'rb', 'ruby'}
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    -- after = "base46",
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.configs.null-ls").setup()
    end,
  },

  ['editorconfig/editorconfig-vim'] = {
    after = "base46",
  },

}
