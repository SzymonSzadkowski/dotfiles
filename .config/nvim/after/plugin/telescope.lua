local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        file_ignore_patterns = { "node_modules", "package-lock.json" },
        path_display = { shorten = { exclude = { 2, -2, -1 } } },
        -- path_display = { "smart" },
        scroll_strategy = "limit",
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--column',
            '--smart-case',
            '--hidden',
        },
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


local builtin = require('telescope.builtin');

vim.keymap.set("n", "<Leader>ff", ":Telescope find_files <CR>")
vim.keymap.set("n", "<Leader>fo", ":Telescope git_files <CR>")
vim.keymap.set("n", "<Leader>fl", ":Telescope live_grep <CR>")
vim.keymap.set("n", "<Leader>fd", function()
    local dir = vim.fn.input("Dir: ", "", "file");

    if dir == "" then
        print('Cancelled');
        return;
    end

    builtin.live_grep({
        prompt_title = "Searching inside: " .. dir,
        cwd = dir,
    })
end)
vim.keymap.set("n", "<Leader>df", function()
    builtin.find_files({
        prompt_title = "Dotfiles",
        cwd = "~/.dotfiles/",
        hidden = true,
    })
end)
vim.keymap.set("n", "<Leader>gb", ":Telescope git_branches <CR>")
vim.keymap.set("n", "<Leader>gs", ":Telescope git_status <CR>")
