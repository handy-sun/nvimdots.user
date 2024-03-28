local definitions = {
	bufs = {
		{ "BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile" },
		{ "BufRead,BufNew", "*.md,*.mkd,*.markdown", "set filetype=markdown" },
		{ "FileType", "make", "set noexpandtab shiftwidth=8 softtabstop=0" },
		{ "FileType", "python", "set tabstop=4 shiftwidth=4 expandtab" },
		{ "FileType", "cmake", "setlocal commentstring=# %s" },
		{ "FileType", "systemd", "setlocal commentstring=# %s" },
	},
}

return definitions
