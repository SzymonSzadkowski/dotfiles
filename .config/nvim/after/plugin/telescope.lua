local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        file_ignore_patterns = { "node_modules", "package-lock.json" },
        path_display = { shorten = { exclude = { 2, -2, -1 } } },
        -- path_display = { "smart" },
        scroll_strategy = "limit",
        layout_strategy = "vertical",
        layout_config = {
            height = 0.95,
            width = 0.95,
            preview_cutoff = 1
        },
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
telescope.load_extension("fzf")

local builtin = require('telescope.builtin');

vim.keymap.set("n", "<Leader>fs", builtin.find_files)
vim.keymap.set("n", "<Leader>fo", builtin.git_files)
vim.keymap.set("n", "<Leader>fl", builtin.live_grep)
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
        cwd = "~/dotfiles/",
        hidden = true,
        file_ignore_patterns = { ".git" }
    })
end)
vim.keymap.set("n", "<Leader>gb", builtin.git_branches)
vim.keymap.set("n", "<Leader>gs", builtin.git_status)
vim.keymap.set("n", "<Leader>di", builtin.diagnostics)
