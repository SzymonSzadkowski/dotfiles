local keymap = vim.api.nvim_set_keymap
local defaultOptions = { noremap = true, silent = true }

keymap("i", "jk", "<Esc>", {})
keymap("n", "<Space>", "<NOP>", defaultOptions)

-- Reload vim settings
keymap("n", "<Leader>r", ":source ~/.dotfiles/.config/nvim/init.lua <CR>", defaultOptions)

-- Moving through panes
keymap("n", "sh", "<C-w>h", defaultOptions)
keymap("n", "sk", "<C-w>k", defaultOptions)
keymap("n", "sj", "<C-w>j", defaultOptions)
keymap("n", "sl", "<C-w>l", defaultOptions)

-- Vertical movement
keymap("n", "<C-d>", "<C-d>zz", defaultOptions)
keymap("n", "<C-u>", "<C-u>zz", defaultOptions)

-- Explorer
-- keymap("n", "<Leader>s", ":NvimTreeToggle <CR>", defaultOptions)
keymap("n", "<Leader>s", ":NvimTreeFindFileToggle <CR>", defaultOptions)

-- Telescope
keymap("n", "<Leader>ff", ":Telescope find_files <CR>", defaultOptions)
keymap("n", "<Leader>fl", ":Telescope live_grep <CR>", defaultOptions)
keymap("n", "<Leader>fd", ":lua require('config.telescope').search_dotfiles() <CR>", defaultOptions)
keymap("n", "<Leader>gg", ":Telescope git_branches <CR>", defaultOptions)
keymap("n", "<Leader>gs", ":Telescope git_status <CR>", defaultOptions)

-- Zoom buffers
keymap("n", "<Leader>m", ":MaximizerToggle <CR>", defaultOptions)
