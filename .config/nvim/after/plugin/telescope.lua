local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        file_ignore_patterns = { "node_modules", "ckeditor", "package-lock.json" },
        path_display = { "smart" },
        hidden = true,
        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        }
    }
})
require("telescope").load_extension("fzf")

vim.keymap.set("n", "<Leader>ff", ":Telescope find_files <CR>")
vim.keymap.set("n", "<Leader>fo", ":Telescope git_files <CR>")
vim.keymap.set("n", "<Leader>fl", ":Telescope live_grep <CR>")
vim.keymap.set("n", "<Leader>df", function()
    require("telescope.builtin").find_files({
        prompt_title = "Dotfiles",
        cwd = "~/.dotfiles/",
        hidden = true,
    })
end)
vim.keymap.set("n", "<Leader>gb", ":Telescope git_branches <CR>")
vim.keymap.set("n", "<Leader>gs", ":Telescope git_status <CR>")
