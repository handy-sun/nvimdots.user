local definitions = {
	bufs = {
		{ "BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile" },
		{ "BufRead,BufNew", "tmux*.conf", "setf tmux" },
		{ "BufRead,BufNew", "*.conf", "setf config" },
		{ "BufRead,BufNew", "*.log", "setf messages" },
		{ "FileType", "yaml", "set shiftwidth=2 expandtab" },
		{ "FileType", "lua", "set noexpandtab tabstop=4 softtabstop=0" },
		{ "FileType", "systemd", "setlocal commentstring=# %s" },
		{ "FileType", "crontab", "setlocal nobackup nowritebackup" },
		{ "FileType", "help", "wincmd L | vertical resize -10" },
	},
}

return definitions
