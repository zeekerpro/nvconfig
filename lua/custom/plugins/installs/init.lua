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
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  ---@type LazySpec
  {
    "mikavilpas/yazi.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    keys = {
      {
        "<leader>-",
        function()
          require("yazi").yazi()
        end,
        { desc = "Open the file manager" },
      },
    },
    ---@type YaziConfig
    opts = {
      -- Below is the default configuration. It is optional to set these values.
      -- You can customize the configuration for each yazi call by passing it to
      -- yazi() explicitly

      -- enable this if you want to open yazi instead of netrw.
      -- Note that if you enable this, you need to call yazi.setup() to
      -- initialize the plugin. lazy.nvim does this for you in certain cases.
      open_for_directories = false,

      -- the floating window scaling factor. 1 means 100%, 0.9 means 90%, etc.
      floating_window_scaling_factor = 0.9,

      -- the transparency of the yazi floating window (0-100). See :h winblend
      yazi_floating_window_winblend = 0,

      -- the path to a temporary file that will be created by yazi to store the
      -- chosen file path. This is used internally but you might want to change
      -- it if there are issues accessing the default path.
      chosen_file_path = '/tmp/yazi_filechosen',

      -- the path to a temporary file that will be created by yazi to store
      -- events
      events_file_path = '/tmp/yazi.nvim.events.txt',

      -- what neovim should do a when a file was opened (selected) in yazi.
      -- Defaults to simply opening the file.
      open_file_function = function(chosen_file, config) end,

      -- completely override the keymappings for yazi. This function will be
      -- called in the context of the yazi terminal buffer.
      set_keymappings_function = function(yazi_buffer_id, config) end,

      hooks = {
        -- if you want to execute a custom action when yazi has been opened,
        -- you can define it here.
        yazi_opened = function(preselected_path, yazi_buffer_id, config)
          -- you can optionally modify the config for this specific yazi
          -- invocation if you want to customize the behaviour
        end,

        -- when yazi was successfully closed
        yazi_closed_successfully = function(chosen_file, config) end,

        -- when yazi opened multiple files. The default is to send them to the
        -- quickfix list, but if you want to change that, you can define it here
        yazi_opened_multiple_files = function(chosen_files, config) end,
      },
    },
  },

  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  }

}

