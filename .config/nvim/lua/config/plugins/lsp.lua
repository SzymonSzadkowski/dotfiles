return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {},
        automatic_installation = false,
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,
          ["html"] = function()
            lspconfig.html.setup({
              capabilities = capabilities,
              filetypes = { "html", "templ"},
            })
          end,
          ["htmx"] = function()
            lspconfig.htmx.setup({
              filetypes = { "html", "templ" },
            })
          end,
          ["tailwindcss"] = function()
            lspconfig.tailwindcss.setup({
              capabilities = capabilities,
              filetypes = { "templ", "javascript", "typescript", "typescriptreact", "css" },
            })
          end,
        },
      })

      vim.filetype.add({ extension = { templ = "templ" } })
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "Attach proper keybindings for lsp",
        group = vim.api.nvim_create_augroup("lsp-keybindings", { clear = true }),
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
          end, opts)
          vim.keymap.set("n", "gr", function()
            vim.lsp.buf.references()
          end, opts)
          vim.keymap.set("n", "<leader>dj", function()
            vim.diagnostic.goto_next()
          end, opts)
          vim.keymap.set("n", "<leader>dk", function()
            vim.diagnostic.goto_prev()
          end, opts)
          vim.keymap.set("n", "<leader>dl", function()
            vim.diagnostic.open_float()
          end, opts)

          vim.keymap.set("n", "<leader>ca", function()
            vim.lsp.buf.code_action()
          end, opts)
          vim.keymap.set("n", "<leader>rn", function()
            vim.lsp.buf.rename()
          end, opts)
        end,
      })
    end,
  },
  {},
}
