vim.keymap.set("i", "jk", "<Esc>", {})
vim.keymap.set("n", "<Space>", "<NOP>")

-- Reload vim settings
vim.keymap.set("n", "<Leader>r", ":source ~/.dotfiles/.config/nvim/init.lua <CR>")

-- Moving through panes
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sl", "<C-w>l")

-- Moving lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv");
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv");

-- Keep cursor at the same position after J command in n mode
vim.keymap.set("n", "J", "mzJ`z");

-- Vertical movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Quickfix list
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz")

-- Tmux
vim.keymap.set("n", "<C-t>", "<cmd> !tmux neww ~/.dotfiles/.scripts/sessionizer.sh<CR>")

-- Paste without replacing register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Explorer
vim.keymap.set("n", "<Leader>s", ":NvimTreeFindFileToggle <CR>")

-- Telescope
vim.keymap.set("n", "<Leader>ff", ":Telescope find_files <CR>")
vim.keymap.set("n", "<Leader>fo", ":Telescope git_files <CR>")
vim.keymap.set("n", "<Leader>fl", ":Telescope live_grep <CR>")
vim.keymap.set("n", "<Leader>df", ":lua require('config.telescope').search_dotfiles() <CR>")
vim.keymap.set("n", "<Leader>gg", ":Telescope git_branches <CR>")
vim.keymap.set("n", "<Leader>gs", ":Telescope git_status <CR>")

-- Zoom buffers
vim.keymap.set("n", "<Leader>m", ":MaximizerToggle <CR>")
