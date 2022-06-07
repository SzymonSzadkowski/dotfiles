vim.o.termguicolors = true
vim.cmd([[
		try
			let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
			let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
			set termguicolors
			colorscheme nightfly
		catch /^Vim\%((\a\+)\)\=:E185/
			colorscheme default
			set background=dark
		endtry
]])
