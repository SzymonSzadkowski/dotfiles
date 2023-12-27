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
        pickers = {
            -- Default configuration for builtin pickers goes here:
            -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
        },
        extensions = {
            fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = "smart_case",       -- or "ignore_case" or "respect_case" },
            },
        }
    }
})
require("telescope").load_extension("fzf")

local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "Dotfiles",
        cwd = "~/.dotfiles/",
        hidden = true,
    })
end

return M
