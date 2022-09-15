local M = {}

M.disabled = {
   n = {
      ["<leader>e"] = "",
      ["<C-n>"] = "",
      ["<leader>h"] = "",
      ["<leader>v"] = "",
      ["<leader>tt"] = "",
      ["<leader>pt"] = "",
      ["<leader>ff"] = "",
      ["<leader>fa"] = "",
      ["<leader>fw"] = "",
      ["<leader>fb"] = "",
      ["<leader>fm"] = "",
      ["<leader>fh"] = "",
      ["<leader>fo"] = "",
      ["<leader>tk"] = "",
      ["<leader>cm"] = "",
      ["<leader>gt"] = "",
      ["<leader>th"] = "",
      ["<leader>ls"] = "",
      ["<leader>rn"] = "",
      ["<leader>ra"] = "",
      ["<leader>n"] = "",
      ["<leader>uu"] = "" ,
      ["gD"] = "",
      ["gd"] = "",
      ["gr"] = "",
      ["gi"] = "",
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
   },
}

M.general = {
   n = {
      ["<Space>h"] = { "<cmd> nohls <CR>", "   no highlight" },
      ["<Space>n"] = { "<cmd> set nu! <CR>", "   toggle line number" },
   },
}

M.tabufline = {

  n = {
    -- new buffer
    ["<S-b>"] = { "<cmd> enew <CR>", "烙 new buffer" },

    -- cycle through buffers
    ["<TAB>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "  goto next buffer",
    },

    ["<S-Tab>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "  goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "   close buffer",
    },

    -- pick buffers via numbers
    ["<Bslash>"] = { "<cmd> TbufPick <CR>", "  Pick buffer" },
  },
}

M.comment = {

  -- toggle comment in both modes
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

M.symbols_outline = {
   n = {
      -- ["<leader>so"] = {"<cmd> SymbolsOutline <CR>", "ﴴ   symbols outline"}
      ["<Space>o"] = { "<cmd> SymbolsOutline <CR>", "ﴴ   symbols outline" },
   },
}

M.nvimtree = {
   n = {
      ["<Space>e"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
   },
}

M.lspconfig = {
   -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

   n = {
      ["<leader>D"] = {
         function()
            vim.lsp.buf.declaration()
         end,
         "   lsp declaration",
      },

      ["<leader>d"] = {
         function()
            vim.lsp.buf.definition()
         end,
         "   lsp definition",
      },

      ["<leader>i"] = {
         function()
            vim.lsp.buf.implementation()
         end,
         "   lsp implementation",
      },

      ["<leader>r"] = {
         function()
            vim.lsp.buf.references()
         end,
         "   lsp references",
      },

      ["<leader>t"] = {
         function()
            vim.lsp.buf.type_definition()
         end,
         "   lsp definition type",
      },

      ["K"] = {
         function()
            vim.lsp.buf.hover()
         end,
         "   lsp hover",
      },

      ["<leader>h"] = {
         function()
            vim.lsp.buf.signature_help()
         end,
         "   lsp signature_help",
      },

      -- ?
      ["<Space>a"] = {
         function()
            require("nvchad_ui.renamer").open()
         end,
         "   lsp rename",
      },

      ["<Space>x"] = {
         function()
            vim.lsp.buf.code_action()
         end,
         "   lsp code_action",
      },

      ["<Space>f"] = {
         function()
            vim.lsp.buf.formatting()
         end,
         "   lsp formatting",
      },

      ["df"] = {
         function()
            vim.diagnostic.open_float()
         end,
         "   floating diagnostic",
      },

      ["d<"] = {
         function()
            vim.diagnostic.goto_prev()
         end,
         "   goto prev",
      },

      ["d>"] = {
         function()
            vim.diagnostic.goto_next()
         end,
         "   goto_next",
      },

      -- todo
      ["dq"] = {
         function()
            vim.diagnostic.setloclist()
         end,
         "   diagnostic setloclist",
      },

      ["<Space>wa"] = {
         function()
            vim.lsp.buf.add_workspace_folder()
         end,
         "   add workspace folder",
      },

      ["<Space>wr"] = {
         function()
            vim.lsp.buf.remove_workspace_folder()
         end,
         "   remove workspace folder",
      },

      ["<Space>wl"] = {
         function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
         end,
         "   list workspace folders",
      },
   },
}

M.telescope = {
   n = {

      -- ["<ESC>"] = {
      --    function()
      --       require("telescope.actions").close()
      --    end
      -- },

      -- find
      ["<leader>f"] = { "<cmd> Telescope find_files <CR>", "   find files" },
      ["<leader>a"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "   find all" },
      ["<leader>g"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
      ["<leader>b"] = { "<cmd> Telescope buffers <CR>", "   find buffers" },
      ["<leader>o"] = { "<cmd> Telescope oldfiles <CR>", "   find oldfiles" },

      -- telescope function mappings
      ["<Space>th"] = { "<cmd> Telescope help_tags <CR>", "ﲉ  help page" },
      ["<Space>tm"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },

      -- theme switcher
      ["<Space>ts"] = { "<cmd> Telescope themes <CR>", "   nvchad themes" },

      -- git
      ["<Space>gc"] = { "<cmd> Telescope git_commits <CR>", "   git commits" },
      ["<Space>gt"] = { "<cmd> Telescope git_status <CR>", "  git status" },
   },
}

M.undotree = {
  n = {
    ["<Space>r"] = { "<cmd> UndotreeToggle <CR>", "社 undo history" }
  }
}

-- extra mappings not registor in whichkey
vim.keymap.set('x', '<', '<gv', { desc = 'Re-select blocks after indenting in visual/select mode '})
vim.keymap.set('x', '>', '>gv|', { desc = 'Re-select blocks after indenting in visual/select mode'})

return M
