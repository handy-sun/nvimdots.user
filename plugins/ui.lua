
local vfn = vim.fn
local ui = {}

ui['liuchengxu/vista.vim'] = {
	lazy = true,
	name = 'vista',
	event = { 'BufReadPost' },
	init = function()
		local expect_width = vfn.float2nr(vfn.winwidth(0) / 6) + 2
		vim.g.vista_sidebar_width = vfn.max({ 32, expect_width })
		vim.g.vista_sidebar_position = 'topleft vertical'
		vim.g.vista_fzf_preview = { 'right:50%' }
		vim.g.vista_default_executive = 'ctags'
	end
}

ui['navarasu/onedark.nvim'] = {
	lazy = true,
	name = 'navarasu-onedark',
	config = function()
		require('onedark').setup {
			style = 'dark',
			toggle_style_key = '<leader>ts',
			code_style = {
				-- comments = 'italic'
			},
			diagnostics = {
				darker = true, -- darker colors for diagnostic
				undercurl = true,-- use undercurl instead of underline for diagnostics
				background = true,
			},
			colors = {
				dg_comment = '#52823f'
			},
			highlights = {
				["@comment"] = {fg = '$dg_comment', fmt = 'italic'},
			}
		}
	end
}

-- ui['joshdick/onedark.vim'] = {
-- 	lazy = true,
-- 	name = 'joshdick-onedark',
-- 	init = require('configs.ui.joshdick-onedark'),
-- }

return ui