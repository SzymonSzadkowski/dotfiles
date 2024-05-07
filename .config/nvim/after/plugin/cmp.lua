local cmp = require("cmp");

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),

        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    },
    sources = {
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        format = function (entry, item)
            local menu_icon = {
                nvim_lsp = "[LSP]",
                nvim_lua = "[LUA]"
            }

            item.menu = menu_icon[entry.source.name]
            return item
        end
    }
})
