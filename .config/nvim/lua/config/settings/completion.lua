vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  preselect = 'None',
  sources = {
    {
      name = "lazydev",
      group_index = 0,
    },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
  },
  mapping = {
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
    ["<CR>"] = cmp.mapping(function(fallback)
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
  },
  formatting = {
    fields = { "abbr", "kind", "menu" },
    expandable_indicator = false,
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = "[LSP]",
        nvim_lua = "[LUA]",
        luasnip = "[SNIP]",
        path = "[PATH]",
        buffer = "[BUF]",
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
})
