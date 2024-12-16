---@diagnostic disable-next-line: missing-fields
require 'nvim-treesitter.configs'.setup {
    ensure_installed = { 'bash', 'c', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', "go", "javascript", "typescript" },
    sync_install = false,
    auto_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
