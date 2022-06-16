return {

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
      require 'custom.plugins.configs.symbols-outline'
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

}
