local definitions = {
	bufs = {
		{ "BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile" },
		{ "BufRead,BufNew", "*.conf", "setf config" },
		{ "BufRead,BufNew", "*.log", "setf messages" },
		{ "FileType", "python", "set tabstop=4 shiftwidth=4 expandtab" },
		{ "FileType", "yaml", "set tabstop=2 shiftwidth=2 expandtab" },
		{ "FileType", "make", "set noexpandtab tabstop=8 softtabstop=0" },
		{ "FileType", "lua", "set noexpandtab tabstop=4 softtabstop=0" },
		{ "FileType", "cmake", "setlocal commentstring=# %s" },
		{ "FileType", "systemd", "setlocal commentstring=# %s" },
	},
}

return definitions
