local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
   "html",
   "cssls",
   "solargraph",
   "volar",
   "ts_ls",
   "tailwindcss",
   "jsonls",
   "emmet_ls",
   "pylsp",
   "pyright",
   "lua_ls",
   "gopls",
   "svelte",
   "ember",
   "glint"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}
