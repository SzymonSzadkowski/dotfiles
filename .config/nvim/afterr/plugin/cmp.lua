local cmp = require("cmp");
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  preselect = cmp.PreselectMode.None,
  mapping = {
    ['<CR>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        if luasnip.expandable() then
          luasnip.expand()
        elseif cmp.get_active_entry() ~= nil then
          cmp.confirm({
            select = true,
          })
        else
          fallback()
        end
      else
        fallback()
      end
    end),

    ['<C-Space>'] = cmp.mapping.complete(),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = {
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "luasnip" }
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = "[LSP]",
        nvim_lua = "[LUA]",
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end
  }
})
