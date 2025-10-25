-- Custom plugins configuration
return {
  -- Override nvim-web-devicons to use default colors
  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      require("custom.core.utils").load_cache("devicons")
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
    event = "VimEnter",  -- Lazy load on VimEnter for better startup performance
    opts = {
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      auto_session_use_git_branch = false,
      auto_session_enable_last_session = false,
    },
  },

  -- Modern symbols outline (replaces deprecated symbols-outline.nvim)
  -- Keymaps are managed in custom/core/mappings.lua
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    config = function()
      require("outline").setup({
        guides = {
          enabled = false,
        },
        outline_window = {
          position = 'right',
          width = 25,
          relative_width = true,
          auto_close = false,
          auto_jump = false,
          jump_highlight_duration = 300,
          center_on_jump = true,
          show_numbers = false,
          show_relative_numbers = false,
          wrap = false,
          show_cursorline = true,
          winhl = 'Normal:Normal,NormalNC:Normal,WinSeparator:WinSeparator',
        },
        outline_items = {
          show_symbol_details = true,
          show_symbol_lineno = false,
          highlight_hovered_item = true,
          auto_set_cursor = true,
          auto_unfold_hover = true,
        },
        symbol_folding = {
          autofold_depth = 1,
          auto_unfold = {
            hovered = true,
            only = true,
          },
          markers = { '', '' },
        },
        symbols = {
          icons = {
            File = { icon = "󰈔", hl = "@text.uri" },
            Module = { icon = "󰏗", hl = "@namespace" },
            Namespace = { icon = "󰦮", hl = "@namespace" },
            Package = { icon = "󰆦", hl = "@namespace" },
            Class = { icon = "󰌗", hl = "@type" },
            Method = { icon = "󰊕", hl = "@method" },
            Property = { icon = "󰜢", hl = "@method" },
            Field = { icon = "󰜢", hl = "@field" },
            Constructor = { icon = "󰆧", hl = "@constructor" },
            Enum = { icon = "󰕘", hl = "@type" },
            Interface = { icon = "󰜰", hl = "@type" },
            Function = { icon = "󰡱", hl = "@function" },
            Variable = { icon = "󰫧", hl = "@constant" },
            Constant = { icon = "󰏿", hl = "@constant" },
            String = { icon = "󰀬", hl = "@string" },
            Number = { icon = "󰎠", hl = "@number" },
            Boolean = { icon = "󰨚", hl = "@boolean" },
            Array = { icon = "󰅪", hl = "@constant" },
            Object = { icon = "󰅩", hl = "@type" },
            Key = { icon = "󰌋", hl = "@type" },
            Null = { icon = "󰟢", hl = "@type" },
            EnumMember = { icon = "󰕘", hl = "@field" },
            Struct = { icon = "󰌗", hl = "@type" },
            Event = { icon = "󰉁", hl = "@type" },
            Operator = { icon = "󰆕", hl = "@operator" },
            TypeParameter = { icon = "󰊄", hl = "@parameter" },
            Component = { icon = "󰡀", hl = "@function" },
            Fragment = { icon = "󰅴", hl = "@constant" },
          },
        },
        keymaps = {
          close = {"<Esc>", "q"},
          goto_location = "<Cr>",
          peek_location = "o",
          goto_and_close = "<S-Cr>",
          restore_location = "<C-g>",
          hover_symbol = "<C-space>",
          toggle_preview = "K",
          rename_symbol = "r", 
          code_actions = "a",
          fold = "h",
          unfold = "l",
          fold_toggle = "<Tab>",
          fold_toggle_all = "<S-Tab>",
          fold_all = "W",
          unfold_all = "E",
          fold_reset = "R",
        },
        providers = {
          priority = { 'lsp', 'coc', 'markdown', 'norg' },
          lsp = {
            blacklist_clients = {},
          },
        },
      })
    end,
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
  -- Keymaps are managed in custom/core/mappings.lua
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Yazi file manager
  -- Keymaps are managed in custom/core/mappings.lua
  {
    "mikavilpas/yazi.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    opts = {
      open_for_directories = false,
      floating_window_scaling_factor = 0.9,
      yazi_floating_window_winblend = 0,
    },
  },

  -- LazyGit integration
  -- Keymaps are managed in custom/core/mappings.lua
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
  },


  
  -- Disable core indent-blankline and configure v3
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    main = "ibl",
    config = function()
      require("custom.core.utils").load_cache("blankline")
      require("ibl").setup(require "custom.configs.blankline")
    end,
  },
  
  -- Disable NvChad/ui completely
  {
    "NvChad/ui",
    enabled = false,
  },
  
  -- Load lualine for enhanced statusline
  require("custom.plugins.lualine"),

}