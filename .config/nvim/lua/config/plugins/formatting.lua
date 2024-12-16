return {
  {
    "stevearc/conform.nvim",
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettierd", stop_after_first = true },
          typescript = { "prettierd", stop_after_first = true },
          typescriptreact = { "prettierd", stop_after_first = true },
        },
      })

      vim.keymap.set("n", "<leader>fa", function()
        local success = conform.format()
        if not success then
          vim.lsp.buf.format()
        end
      end, opts)
    end,
  },
}
