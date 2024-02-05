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
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
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

  -- {
  --   'Exafunction/codeium.vim',
  --   lazy = false
  -- },

  -- {
  --   'github/copilot.vim',
  --   lazy = false
  -- },

  {
    'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    lazy = false,
    config = function()
      require("copilot").setup(require("custom.plugins.installs.copilot"))
    end
  },

  {
    "zbirenbaum/copilot-cmp",
    lazy = false,
    dependencies = {"zbirenbaum/copilot.lua" },
    config = function ()
      require("copilot_cmp").setup()
    end
  },

  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   lazy = true,
  --   config = function ()
  --     require("chatgpt").setup()
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   }
  -- },
  --
  {
    "Bryley/neoai.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    cmd = {
      "NeoAI",
      "NeoAIOpen",
      "NeoAIClose",
      "NeoAIToggle",
      "NeoAIContext",
      "NeoAIContextOpen",
      "NeoAIContextClose",
      "NeoAIInject",
      "NeoAIInjectCode",
      "NeoAIInjectContext",
      "NeoAIInjectContextCode",
    },
    keys = {
      { "<leader>as", desc = "summarize text" },
      { "<leader>ag", desc = "generate git message" },
    },
    config = function()
      require("neoai").setup({
          -- Options go here
      })
    end,
  },

  -- https://www.reddit.com/r/neovim/comments/14g36rs/minifiles_navigate_and_manipulate_file_system/
  -- {
  --   'echasnovski/mini.nvim',
  --   version = '*',
  --   config = function ()
  --     require("mini").setup()
  --   end
  -- },


  {
    "ray-x/go.nvim",
    lazy=false,
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()

      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
         require('go.format').goimport()
        end,
        group = format_sync_grp,
      })

    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  }


}

