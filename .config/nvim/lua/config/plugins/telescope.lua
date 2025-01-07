return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = require("telescope.themes").get_ivy({
          mappings = {
            i = {
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
            },
          },
        }),
        file_ignore_patterns = { "node_modules", "package-lock.json" },
        extensions = {
          fzf = {},
        },
      })
      telescope.load_extension("fzf")

      -- Find
      vim.keymap.set("n", "<Leader>fj", builtin.find_files)
      vim.keymap.set("n", "<Leader>fk", builtin.git_files)
      vim.keymap.set("n", "<Leader>fs", builtin.lsp_dynamic_workspace_symbols)
      vim.keymap.set("n", "<Leader>fc", function()
        builtin.find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end)
      vim.keymap.set("n", "<Leader>fl", require("config.settings.telescope").live_with_args)

      -- Git
      vim.keymap.set("n", "<Leader>gb", builtin.git_branches)
      vim.keymap.set("n", "<Leader>gs", builtin.git_status)

      -- Utils
      vim.keymap.set("n", "<Leader>di", builtin.diagnostics)
      vim.keymap.set("n", "<Leader>fh", builtin.help_tags)
    end,
  },
}
