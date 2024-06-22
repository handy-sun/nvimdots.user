local tool = {}

-- tool['ibhagwan/fzf-lua'] = {
	-- lazy = true,
	-- name = 'fzf',
	-- dependencies = { 'nvim-tree/nvim-web-devicons' },
	-- config = function()
		-- require('fzf-lua').setup({})
	-- end
-- }

tool['junegunn/fzf'] = {
	lazy = true,
	ft = 'fzf',
	init = function()
		vim.g.fzf_buffers_jump = 1
	end
}

return tool
