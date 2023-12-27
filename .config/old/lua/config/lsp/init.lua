local lsp = require('lsp-zero').preset()

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr, omit = { "<Tab>" } })
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, {buffer = bufnr, remap = false})
end)

lsp.ensure_installed({
    "rust_analyzer",
})

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        ['null-ls'] = { 'javascript', 'typescript', 'jsx', 'json', 'lua' },
        ['solidity'] = { 'solidity' },
    }
})

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        ['<Tab>'] = cmp_action.luasnip_next(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    }
})

local lspconfig = require 'lspconfig';

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.solidity.setup({
    cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
    filetypes = { "solidity" },
    root_dir = require("lspconfig.util").find_git_ancestor,
    single_file_support = true,
})

lsp.setup()

-- Null-ls
require('config.lsp.null-ls');
