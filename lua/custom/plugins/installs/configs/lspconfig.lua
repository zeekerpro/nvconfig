local lspconfig_core = require "plugins.configs.lspconfig"
local on_attach = lspconfig_core.on_attach
local capabilities = lspconfig_core.capabilities

local lspconfig = require "lspconfig"

local servers = {
 "html",
 "cssls",
 "solargraph",
 "volar",
 "tsserver",
 "tailwindcss",
 "jsonls",
 "emmet_ls",
 "pylsp",
 "pyright",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
     on_attach = on_attach,
     capabilities = capabilities,
  }
end
