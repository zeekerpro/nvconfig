return {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.plugins.overrides.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.overrides.lspconfig"
    end,
  },

  -- Override to setup mason-lspconfig
  {
    "williamboman/mason.nvim",
    opts = require "custom.plugins.overrides.mason"
  },

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "custom.plugins.overrides.treesitter"
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "custom.plugins.overrides.nvimtree",
  },

  {
    "akinsho/bufferline.nvim",
    opts = require  "custom.plugins.overrides.bufferline"
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = require "custom.plugins.overrides.blankline"
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = require "custom.plugins.overrides.telescope"
  }

}
