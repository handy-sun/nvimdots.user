local options = {
	wrap = true,
	showbreak = '⣿',
	showcmd = true,
	gdefault = true,
	-- clipboard = 'unnamed',
	cursorcolumn = false,
	timeoutlen = 700,
	ttimeoutlen = 10,
	cmdwinheight = 7,
	wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**,*build*",
}

if vim.fn.executable('rg') == 1 then
	options['grepprg'] = 'rg --hidden --vimgrep --smart-case -- '
else
	options['grepprg'] = 'grep --binary-files=without-match -irn $*'
	options['grepformat'] = '%f:%l:%m,%f:%l%m,%f  %l%m'
end

vim.opt.suffixes:append('.a,.1,.class')

return options
