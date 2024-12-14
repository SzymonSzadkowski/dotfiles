require('gitsigns').setup {
    signcolumn          = false,
    numhl               = true,
    linehl              = false,
    word_diff           = false,
    watch_gitdir        = {
        interval = 1000,
        follow_files = true
    },
    attach_to_untracked = true,
    sign_priority       = 6,
    update_debounce     = 100,
    status_formatter    = nil, -- Use default
    max_file_length     = 40000,
    on_attach           = function(bufnr)
        local function map(mode, lhs, rhs, opts)
            opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
        end

        -- Navigation
        map('n', '<leader>cl', "&diff ? '<leader>cl' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
        map('n', '<leader>ch', "&diff ? '<leader>ch' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

        -- Actions
        map('n', '<leader>hu', '<cmd>Gitsigns reset_hunk<CR>')
        map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
        map('n', '<leader>hb', '<cmd>Gitsigns blame_line<CR>')
        map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
    end
}
