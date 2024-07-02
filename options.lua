local options = {
	wrap = true,
	showbreak = '⣿',
	showcmd = true,
	gdefault = true,
	clipboard = '',
	cursorcolumn = false,
	timeoutlen = 700,
	ttimeoutlen = 10,
	cmdwinheight = 7,
	wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**,*build*",
}

local function set_conditional_options()
	if vim.fn.executable('rg') == true then
		options = {
			grepprg = 'rg --hidden --vimgrep --smart-case --'
		}
	else
		options = {
			grepformat = '%f:%l:%m,%f:%l%m,%f  %l%m',
			grepprg = 'grep --binary-files=without-match -irn $*'
		}
	end
end

vim.opt.suffixes:append('.a,.1,.class')
-- vim.opt.wildignore:append("*build*")

set_conditional_options()

return options
