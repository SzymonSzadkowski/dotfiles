local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    sources = {
        formatting.prettier,
        --formatting.eslint_d,
        diagnostics.eslint,
        formatting.stylua,
        formatting.prismaFmt,
    },
    -- Formatting on save
    --on_attach = function(client)
    --    if client.server_capabilities.documentFormattingProvider then
    --        vim.cmd([[
    --          augroup LspFormatting
    --              autocmd! * <buffer>
    --              autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ bufnr = bufnr })
    --					augroup END
    --          ]])
    --    end
    --end,
})
