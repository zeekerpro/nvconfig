return {

  {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.overrides.null-ls").setup()
    end,
  },

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
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
    init = require("core.utils").lazy_load "nvim-treesitter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      -- return require "plugins.configs.treesitter"
      return require "custom.plugins.overrides.treesitter"
    end,
    config = function(_, opts)
      pcall(dofile, vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)
    end,
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
