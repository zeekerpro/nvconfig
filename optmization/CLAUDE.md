# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a customized NvChad v2.5 Neovim configuration built on top of the NvChad framework. The configuration follows a modular structure with extensive customization and plugin overrides.

### Key Architecture Points:

- **Base Framework**: NvChad v2.5 with lazy.nvim as the plugin manager
- **Configuration Structure**: 
  - `init.lua` - Main entry point that bootstraps lazy.nvim and loads NvChad core
  - `lua/chadrc.lua` - NvChad configuration overrides (theme, UI settings)
  - `lua/custom/` - All custom configurations and overrides
  - `lua/nvchad/` - Core NvChad modules (should not be modified)

- **Custom Configuration Flow**:
  1. `init.lua` loads NvChad core options and autocmds
  2. Custom configuration loaded via `require "custom"`
  3. Plugins loaded via lazy.nvim setup
  4. Custom mappings loaded after plugins via vim.schedule

### Custom Module Structure:

- `lua/custom/init.lua` - Main custom entry point, sets leader key (`;`) and loads core customizations
- `lua/custom/core/` - Core customizations (options, mappings)
- `lua/custom/configs/` - Plugin-specific configurations
- `lua/custom/plugins/` - Plugin definitions and overrides

## Development Commands

### Plugin Management:
- `:Lazy` - Open lazy.nvim plugin manager
- `:Lazy sync` - Update all plugins
- `:Lazy clean` - Remove unused plugins

### Code Formatting:
- Uses Stylua for Lua formatting with config in `.stylua.toml`
- Format settings: 120 column width, 2-space indentation, Unix line endings
- Auto-format on save enabled for LSP-managed files

### Theme Management:
- Primary theme: `catppuccin` with transparency enabled
- Theme toggle: `catppuccin` ↔ `github_light`
- Custom theme picker via `<Space>ts`

## Plugin Architecture

### Replaced Core Components:
- **NvChad/ui**: Completely disabled and replaced with custom UI components
- **Statusline**: Uses custom lualine configuration instead of NvChad statusline
- **Buffer management**: Uses akinsho/bufferline.nvim instead of NvChad tabufline

### Key Plugin Overrides:
- **nvim-tree**: Custom configuration with optimized icons
- **nvim-web-devicons**: Uses default colors instead of theme overrides
- **indent-blankline**: Custom v3 configuration

### Major Added Plugins:
- **bufferline.nvim**: VSCode-like buffer tabs
- **lualine.nvim**: Enhanced statusline
- **auto-session**: Automatic session management
- **symbols-outline.nvim**: Code outline/symbols viewer
- **flash.nvim**: Quick navigation
- **yazi.nvim**: File manager integration
- **lazygit.nvim**: Git interface

## Key Mappings

### Leader Keys:
- **Leader**: `;` (semicolon)
- **Space**: Used for secondary mappings

### File Operations:
- `<leader>f` - Find files
- `<leader>a` - Find all files (including hidden)
- `<leader>g` - Live grep
- `<leader>b` - Find buffers
- `<leader>o` - Old files

### Navigation:
- `<Space>e` - Toggle nvim-tree
- `<Space>o` - Toggle symbols outline
- `<leader>-` - Open yazi file manager
- `<Space>lg` - Open LazyGit

### Buffer Management:
- `<TAB>` / `<S-Tab>` - Cycle through buffers
- `<D-w>` - Close buffer
- `<S-b>` - New buffer

### LSP:
- Standard LSP keys work: `gd`, `gD`, `gr`, `gi`
- `<Space>rn` - LSP rename
- `<Space>ca` - Code actions
- `<Space>fm` - Format code
- `df` - Show diagnostics float
- `d<` / `d>` - Previous/next diagnostic

## Configuration Conventions

### File Structure:
- Keep all customizations in `lua/custom/`
- Never modify files in `lua/nvchad/` (core NvChad files)
- Plugin configurations go in `lua/custom/configs/`
- New plugins defined in `lua/custom/plugins/init.lua`

### Coding Style:
- 2-space indentation
- 120 character line limit
- Unix line endings
- Prefer double quotes in Lua
- Use lazy loading for plugins when possible

### Theme and UI:
- Transparency enabled by default
- Colors managed through base46 cache system
- Custom highlights defined in `lua/custom/highlights.lua`
- UI components use custom configurations over NvChad defaults

## Important Notes

- **NvChad UI Disabled**: The core NvChad/ui plugin is completely disabled and replaced with custom components
- **Leader Key**: Uses `;` instead of space for primary leader
- **Custom Mappings**: Many default NvChad mappings are disabled and replaced with custom ones
- **Session Management**: Auto-session plugin manages workspace sessions automatically
- **Transparency**: UI transparency is enabled and handled through custom autocmds