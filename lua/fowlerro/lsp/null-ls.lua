local null_ls = require("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  debug = true,

  sources = {
    formatting.prettierd.with({
      filetypes = { 'html', 'json' ,'css', 'javascript', 'typescript', 'typescriptreact', 'javascriptreact' },
    }),
    -- formatting.eslint_d,
    formatting.black,
    diagnostics.eslint_d.with({
      extra_args = { "--rule 'quotes: [error, double]'" }
    }),
    diagnostics.flake8.with({ extra_args = {
      "--max-line-length=120"
    }
    })
  },
  on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format({ bufnr = bufnr })
                    -- vim.lsp.buf.formatting_sync(nil, 10000)
                end,
            })
        end
    end,
})
