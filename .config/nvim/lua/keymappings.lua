local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
keymap("i", "jk", "<Esc>", {})
keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })

-- Reload vim settings
keymap("n", "<Leader>r", ":source ~/.dotfiles/.config/nvim/init.lua <CR>", { noremap = true, silent = true })

-- Moving through panes
keymap("n", "sh", "<C-w>h", { noremap = true, silent = true })
keymap("n", "sk", "<C-w>k", { noremap = true, silent = true })
keymap("n", "sj", "<C-w>j", { noremap = true, silent = true })
keymap("n", "sl", "<C-w>l", { noremap = true, silent = true })

-- Explorer
-- keymap("n", "<Leader>s", ":NvimTreeToggle <CR>", { noremap = true, silent = true })
keymap("n", "<Leader>s", ":NvimTreeFindFileToggle <CR>", { noremap = true, silent = true })

-- Telescope
keymap("n", "<Leader>ff", ":Telescope find_files <CR>", { noremap = true, silent = true })
keymap("n", "<Leader>fl", ":Telescope live_grep <CR>", { noremap = true, silent = true })
keymap("n", "<Leader>fd", ":lua require('config.telescope').search_dotfiles() <CR>", { noremap = true, silent = true })
keymap("n", "<Leader>gg", ":Telescope git_branches <CR>", { noremap = true, silent = true })
keymap("n", "<Leader>gs", ":Telescope git_status <CR>", { noremap = true, silent = true })

-- Zoom buffers
keymap("n", "<Leader>m", ":MaximizerToggle <CR>", { noremap = true, silent = true })
