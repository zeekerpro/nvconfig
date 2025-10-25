---@type MappingsTable
local M = {}
local utils = require("custom.core.utils")

-- Disable default mappings
M.disabled = {
  n = {
    ["<leader>e"] = "",  -- Disable NvChad default, use <Space>e
    ["<C-n>"] = "",      -- Disable NvChad default, use <Space>e
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    ["<leader>i"] = "", -- Disable terminal mappings
    ["<leader>x"] = "", -- Disable default buffer close
    ["<leader>tt"] = "",
    ["<leader>pt"] = "",
    ["<leader>ff"] = "",  -- Use <leader>f instead
    ["<leader>fa"] = "",  -- Use <leader>a instead  
    ["<leader>fw"] = "",  -- Use <leader>g instead
    ["<leader>fb"] = "",  -- Use <leader>b instead
    ["<leader>fm"] = "",  -- Use <Space>f instead
    ["<leader>fh"] = "",  -- Use <Space>th instead
    ["<leader>fo"] = "",  -- Use <leader>o instead
    ["<leader>tk"] = "",
    ["<leader>cm"] = "",
    ["<leader>gt"] = "",
    ["<leader>th"] = "",
    ["<leader>ls"] = "",
    ["<leader>rn"] = "",
    ["<leader>ra"] = "",
    ["<leader>n"] = "",
    ["<leader>uu"] = "",
    -- ["gD"] = "",
    -- ["gd"] = "",
    -- ["gr"] = "",
    -- ["gi"] = "",
  },
  i = {
    ["<C-b>"] = "",
    ["<C-e>"] = "",
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },
  t = {
    ["<C-x>"] = "",
    ["<A-h>"] = "", -- Disable terminal toggle mappings
    ["<A-v>"] = "",
    ["<A-i>"] = "",
  },
}

-- General mappings
M.general = {
  n = {
    ["<Space>h"] = { "<cmd> nohls <CR>", "   no highlight" },
    ["<Space>n"] = { "<cmd> set nu! <CR>", "   toggle line number" },
  },
}

-- Buffer line mappings
M.bufferline = {
  n = {
    -- New buffer
    ["<S-b>"] = { "<cmd> enew <CR>", "烙 new buffer" },

    -- Cycle through buffers
    ["<TAB>"] = { "<cmd>BufferLineCycleNext<CR>", "  goto next buffer" },
    ["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<CR>", "  goto prev buffer" },

    -- Close buffer with smart close function
    ["<leader>x"] = {
      utils.smart_close_buffer,
      "   close buffer"
    },

    -- Close all buffers except current
    ["<leader>xx"] = {
      utils.close_all_buffers,
      "   close all buffers"
    },

    -- Pick buffers via telescope
    ["<Bslash>"] = { "<cmd> Telescope buffers <CR>", "  Pick buffer" },
  },
}

-- Comment mappings
M.comment = {
  n = {
    ["<Space>/"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  v = {
    ["<Space>/"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

-- Modern outline (symbols outline replacement)
M.outline = {
  n = {
    ["<Space>o"] = { "<cmd> Outline <CR>", "ﴴ   symbols outline" },
  },
}

-- NvimTree
M.nvimtree = {
  n = {
    ["<Space>e"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
  },
}

-- LSP mappings (keeping only essential custom ones, standard gd/gr/gi work too)
M.lspconfig = {
  n = {
    -- Keep standard LSP keys: gd, gD, gr, gi work automatically

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "   lsp hover",
    },

    ["<Space>rn"] = {
      function()
        vim.lsp.buf.rename()
      end,
      "   lsp rename",
    },

    ["<Space>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "   lsp code_action",
    },

    ["<Space>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "   lsp formatting",
    },

    ["df"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "   floating diagnostic",
    },

    ["d<"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "   goto prev",
    },

    ["d>"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "   goto_next",
    },

    ["dq"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "   diagnostic setloclist",
    },

    ["<Space>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "   add workspace folder",
    },

    ["<Space>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "   remove workspace folder",
    },

    ["<Space>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "   list workspace folders",
    },
  },
}

-- Telescope mappings
M.telescope = {
  n = {
    -- File finding
    ["<leader>f"] = { "<cmd> Telescope find_files <CR>", "   find files" },
    ["<leader>a"] = { 
      "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", 
      "   find all" 
    },
    ["<leader>g"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
    ["<leader>b"] = { "<cmd> Telescope buffers <CR>", "   find buffers" },
    ["<leader>o"] = { "<cmd> Telescope oldfiles <CR>", "   find oldfiles" },

    -- Telescope functions
    ["<Space>th"] = { "<cmd> Telescope help_tags <CR>", "ﲉ  help page" },
    ["<Space>tm"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },

    -- Theme switcher
    ["<Space>ts"] = { "<cmd> Telescope themes <CR>", "   nvchad themes" },

    -- Git
    ["<Space>gc"] = { "<cmd> Telescope git_commits <CR>", "   git commits" },
    ["<Space>gt"] = { "<cmd> Telescope git_status <CR>", "  git status" },
  },
}

-- Undotree
M.undotree = {
  n = {
    ["<Space>r"] = { "<cmd> UndotreeToggle <CR>", "社 undo history" }
  }
}

-- Extra mappings not registered in whichkey
vim.keymap.set('x', '<', '<gv', { desc = 'Re-select blocks after indenting in visual/select mode' })
vim.keymap.set('x', '>', '>gv|', { desc = 'Re-select blocks after indenting in visual/select mode' })

return M