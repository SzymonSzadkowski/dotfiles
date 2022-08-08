vim.o.termguicolors = true
vim.cmd([[
		try
			let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
			let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
			set termguicolors
			let g:tokyonight_style = 'night'
			let g:tokyonight_enable_italic = 1
			colorscheme tokyonight
		catch /^Vim\%((\a\+)\)\=:E185/
			colorscheme default
			set background=dark
		endtry
]])
