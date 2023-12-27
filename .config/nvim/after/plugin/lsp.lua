local lsp = require('lsp-zero')

lsp.on_attach(function(_, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>fa", function() vim.lsp.buf.format() end, opts)
end)

local cmp = require("cmp");
local cmp_action = require("lsp-zero").cmp_action();
cmp.setup({
        mapping = {
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                ['<C-Space>'] = cmp.mapping.complete(),

                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),

                ['<Tab>'] = cmp_action.luasnip_next(),
                ['<S-Tab>'] = cmp_action.select_prev_or_fallback()
        }
})

require('mason').setup({})
require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
                lsp.default_setup,
                lua_ls = function()
                        local lua_opts = lsp.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                end,
        },
})
