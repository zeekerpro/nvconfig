-- Custom plugins configuration
return {
  -- Override nvim-web-devicons to use default colors
  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      local cache_file = vim.g.base46_cache .. "devicons"
      if vim.loop.fs_stat(cache_file) then
        dofile(cache_file)
      end
      -- Use default devicons without override to get colors
      return { default = true }
    end,
  },
  
  -- VSCode-like buffer tabs
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = function()
      return require "custom.configs.bufferline"
    end,
  },
  
  -- Override nvim-tree with optimized icons
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "custom.configs.nvimtree"
    end,
  },
  -- Comment plugin (required for mappings)
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  },
  -- Better escape plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- Automated session manager
  {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      auto_session_use_git_branch = false,
      auto_session_enable_last_session = false,
    },
  },

  -- Symbols outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
    opts = {
      highlight_hovered_item = true,
      show_guides = true,
      auto_preview = false,
      position = 'right',
      relative_width = true,
      width = 25,
      auto_close = false,
      show_numbers = false,
      show_relative_numbers = false,
      show_symbol_details = true,
      preview_bg_highlight = 'Pmenu',
      autofold_depth = nil,
      auto_unfold_hover = true,
      fold_markers = { '', '' },
      wrap = false,
      keymaps = {
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
        fold = "h",
        unfold = "l",
        fold_all = "W",
        unfold_all = "E",
        fold_reset = "R",
      },
      lsp_blacklist = {},
      symbol_blacklist = {},
      symbols = {
        File = { icon = "", hl = "@text.uri" },
        Module = { icon = "", hl = "@namespace" },
        Namespace = { icon = "", hl = "@namespace" },
        Package = { icon = "", hl = "@namespace" },
        Class = { icon = "𝓒", hl = "@type" },
        Method = { icon = "ƒ", hl = "@method" },
        Property = { icon = "", hl = "@method" },
        Field = { icon = "", hl = "@field" },
        Constructor = { icon = "", hl = "@constructor" },
        Enum = { icon = "ℰ", hl = "@type" },
        Interface = { icon = "ﰮ", hl = "@type" },
        Function = { icon = "", hl = "@function" },
        Variable = { icon = "", hl = "@constant" },
        Constant = { icon = "", hl = "@constant" },
        String = { icon = "𝓐", hl = "@string" },
        Number = { icon = "#", hl = "@number" },
        Boolean = { icon = "⊨", hl = "@boolean" },
        Array = { icon = "", hl = "@constant" },
        Object = { icon = "⦿", hl = "@type" },
        Key = { icon = "🔐", hl = "@type" },
        Null = { icon = "NULL", hl = "@type" },
        EnumMember = { icon = "", hl = "@field" },
        Struct = { icon = "𝓢", hl = "@type" },
        Event = { icon = "🗲", hl = "@type" },
        Operator = { icon = "+", hl = "@operator" },
        TypeParameter = { icon = "𝙏", hl = "@parameter" },
        Component = { icon = "", hl = "@function" },
        Fragment = { icon = "", hl = "@constant" },
      },
    },
  },

  -- Rails support
  {
    "tpope/vim-rails",
    ft = { "rb", "ruby" },
  },

  -- EditorConfig support
  {
    "editorconfig/editorconfig-vim",
    event = "BufReadPre",
  },

  -- Emmet for HTML/CSS
  {
    "mattn/emmet-vim",
    ft = {
      "html", "css", "vue", "javascript", "javascriptreact",
      "svelte", "wxml", "wxss", "scss", "sass", "erb", "hbs"
    },
    config = function()
      vim.g.user_emmet_leader_key = '<C-Z>'
      vim.g.user_emmet_mode = 'i'
      vim.g.user_emmet_install_global = 0
      vim.g.user_emmet_install_command = 0
      vim.g.user_emmet_complete_tag = 1
    end,
  },

  -- Undo tree
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" },
  },

  -- WeChat Mini Program support
  {
    "chemzqm/wxapp.vim",
    ft = { "wxss", "wxml" },
  },

  -- Flash.nvim for quick navigation
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  -- Yazi file manager
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
        desc = "Open the file manager",
      },
    },
    opts = {
      open_for_directories = false,
      floating_window_scaling_factor = 0.9,
      yazi_floating_window_winblend = 0,
    },
  },

  -- LazyGit integration
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<Space>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    },
  },

  -- Augment.vim for AI assistance
  {
    "augmentcode/augment.vim",
    lazy = false,
    keys = {
      { "<Space>c", "<cmd>Augment chat<cr>", desc = "augmentcode" }
    },
  },

  -- Disable nvterm
  {
    "NvChad/nvterm",
    enabled = false,
  },

}