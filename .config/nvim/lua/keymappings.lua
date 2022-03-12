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
keymap("n", "<Leader>s", ":NvimTreeToggle <CR>", { noremap = true, silent = true })

-- Telescope
keymap("n", "<Leader>t", ":Telescope find_files <CR>", { noremap = true, silent = true })
keymap("n", "<Leader>f", ":Telescope live_grep <CR>", { noremap = true, silent = true })
keymap(
	"n",
	"<Leader>gc",
	':lua require("telescope").extensions.git_worktree.git_worktrees() <CR>',
	{ noremap = true, silent = true }
)
keymap(
	"n",
	"<Leader>ga",
	':lua require("telescope").extensions.git_worktree.create_git_worktree() <CR>',
	{ noremap = true, silent = true }
)
