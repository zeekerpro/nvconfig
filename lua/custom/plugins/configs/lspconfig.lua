local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config
   local servers = {
     "html",
     "cssls",
     "solargraph",
     "volar",
     "tsserver",
     "tailwindcss",
     "jsonls",
     "emmet_ls"
   }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
      }
   end
end

return M
