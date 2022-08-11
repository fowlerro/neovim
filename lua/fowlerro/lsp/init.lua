local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then return end

require("fowlerro.lsp.lsp-installer")
require("fowlerro.lsp.handlers").setup()
require("fowlerro.lsp.null-ls")
