-- Replace NvChad statusline with lualine for richer display
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Custom theme matching terminal background
    local custom_theme = {
      normal = {
        a = { bg = "#89b4fa", fg = "#1e1e2e", gui = "bold" },
        b = { bg = "#313244", fg = "#cdd6f4" },
        c = { bg = "#1e1e2e", fg = "#bac2de" },
      },
      insert = {
        a = { bg = "#a6e3a1", fg = "#1e1e2e", gui = "bold" },
        b = { bg = "#313244", fg = "#cdd6f4" },
        c = { bg = "#1e1e2e", fg = "#bac2de" },
      },
      visual = {
        a = { bg = "#f9e2af", fg = "#1e1e2e", gui = "bold" },
        b = { bg = "#313244", fg = "#cdd6f4" },
        c = { bg = "#1e1e2e", fg = "#bac2de" },
      },
      replace = {
        a = { bg = "#f38ba8", fg = "#1e1e2e", gui = "bold" },
        b = { bg = "#313244", fg = "#cdd6f4" },
        c = { bg = "#1e1e2e", fg = "#bac2de" },
      },
      command = {
        a = { bg = "#cba6f7", fg = "#1e1e2e", gui = "bold" },
        b = { bg = "#313244", fg = "#cdd6f4" },
        c = { bg = "#1e1e2e", fg = "#bac2de" },
      },
      inactive = {
        a = { bg = "#313244", fg = "#6c7086" },
        b = { bg = "#1e1e2e", fg = "#6c7086" },
        c = { bg = "#1e1e2e", fg = "#6c7086" },
      },
    }

    require("lualine").setup({
      options = {
        theme = custom_theme,
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = { statusline = { "NvimTree", "alpha" } },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              local mode_map = {
                NORMAL = "N",
                INSERT = "I",
                VISUAL = "V",
                ["V-LINE"] = "VL",
                ["V-BLOCK"] = "VB",
                COMMAND = "C",
                REPLACE = "R",
                TERMINAL = "T",
              }
              return mode_map[str] or str:sub(1, 1)
            end,
            separator = { right = "" },
          },
        },
        lualine_b = {
          {
            "branch",
            icon = "",
            color = { fg = "#89b4fa", gui = "bold" },
          },
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
            diff_color = {
              added = { fg = "#a6e3a1" },
              modified = { fg = "#f9e2af" },
              removed = { fg = "#f38ba8" },
            },
          },
        },
        lualine_c = {
          {
            "filename",
            file_status = true,
            newfile_status = true,
            path = 1,
            symbols = {
              modified = " ●",
              readonly = " ",
              unnamed = "[No Name]",
              newfile = " [New]",
            },
            color = { fg = "#cdd6f4" },
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
            diagnostics_color = {
              error = { fg = "#f38ba8" },
              warn = { fg = "#f9e2af" },
              info = { fg = "#89dceb" },
              hint = { fg = "#94e2d5" },
            },
          },
          {
            function()
              local clients = vim.lsp.get_active_clients({ bufnr = 0 })
              if #clients == 0 then
                return ""
              end
              return " LSP"
            end,
            color = { fg = "#a6e3a1", gui = "bold" },
          },
          {
            "filetype",
            colored = true,
            icon_only = false,
            color = { fg = "#cba6f7" },
          },
        },
        lualine_y = {
          {
            "encoding",
            fmt = string.upper,
            color = { fg = "#fab387" },
          },
          {
            "fileformat",
            fmt = string.upper,
            icons_enabled = false,
            color = { fg = "#fab387" },
          },
        },
        lualine_z = {
          {
            "location",
            separator = { left = "" },
            color = { fg = "#1e1e2e", bg = "#89b4fa", gui = "bold" },
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 
          {
            "filename",
            color = { fg = "#6c7086" },
          }
        },
        lualine_x = { 
          {
            "location",
            color = { fg = "#6c7086" },
          }
        },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}