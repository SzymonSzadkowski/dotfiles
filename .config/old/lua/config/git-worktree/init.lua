local worktree = require("git-worktree")

worktree.setup({})

worktree.on_tree_change(function(op)
	-- This makes sure that newly created windows have proper default directory
	-- after worktree change
	if op ~= worktree.Operations.Delete then
		local cwd = vim.fn.getcwd()
		local tmux_cmd = string.format("tmux attach -c %s", cwd)
		vim.fn.system(tmux_cmd)
	end
end)
