local mappings = {}

-- Place global keymaps here.
-- mappings["plug_map"] = {}

-- custom {{{1
local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback
local et = bind.escape_termcode

mappings["plug_map"] = {
	-- !! Disable these mappings
	["n|<C-s>"] = "",
	["n|<Esc>"] = "",
	["n|<A-h>"] = "",
	["n|<A-l>"] = "",
	["n|<A-j>"] = "",
	["n|<A-k>"] = "",
	["n|<C-q>"] = "",
	["n|<A-S-q>"] = "",
	["v|J"] = "",
	["v|K"] = "",
	-- noh
	["n|<leader><space>"] = map_callback(function()
			_flash_esc_or_noh()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("edit: Clear search highlight"),
	-- comment toggle line(s)
	["n|<leader>/"] = map_callback(function()
			return vim.v.count == 0 and et("<Plug>(comment_toggle_linewise_current)")
				or et("<Plug>(comment_toggle_linewise_count)")
		end)
		:with_silent()
		:with_noremap()
		:with_expr()
		:with_desc("edit: Toggle comment for line (custom)"),
	-- Select all
	["n|<C-a>"] = map_cmd("ggVG"):with_noremap():with_desc("Select all contents"),
	-- Resize window
	["n|<leader>["] = map_cr("vertical resize -4"):with_silent():with_desc("window: Decrease vertically"),
	["n|<leader>]"] = map_cr("vertical resize +4"):with_silent():with_desc("window: Increase vertically"),
	["n|<leader>;"] = map_cr("resize -2"):with_silent():with_desc("window: Decrease horizontally"),
	["n|<leader>'"] = map_cr("resize +2"):with_silent():with_desc("window: Increase horizontally"),
	-- Save and quit
	["n|<leader>s"] = map_cr("w"):with_noremap():with_silent():with_desc("edit: Save file"),
	["n|<leader>q"] = map_cr("wq"):with_desc("edit: Save file and quit"),
	["n|<leader><BS>"] = map_cr("wqa"):with_desc("edit: Save All file(s) and quit"),
	["n|<leader>e"] = map_cr("q!"):with_desc("edit: Force quit"),
	-- Tab close
	-- ["n|tc"] = map_cr("tabclose"):with_noremap():with_desc("tab: Close current tab"),
	-- split 4 pos and fill with absolute path of current file
	["n|sh"] = map_cmd(":setlocal nosplitright<CR>:vsplit <C-R>=expand('%:p:h') . '/' <CR>"):with_noremap():with_desc("split left and fill absolute path"),
	["n|sl"] = map_cmd(":setlocal splitright<CR>:vsplit <C-R>=expand('%:p:h') . '/' <CR>"):with_noremap():with_desc("split right and fill absolute path"),
	["n|sk"] = map_cmd(":setlocal nosplitbelow<CR>:split <C-R>=expand('%:p:h') . '/' <CR>"):with_noremap():with_desc("split above and fill absolute path"),
	["n|sj"] = map_cmd(":setlocal splitbelow<CR>:split <C-R>=expand('%:p:h') . '/' <CR>"):with_noremap():with_desc("split below and fill absolute path"),

	-- Edit file
	["n|<A-c>"] = map_cmd("c$"):with_noremap():with_silent():with_desc("edit: Replace text to EOL"),
	["n|<leader><CR>"] = map_cmd("i<CR><Esc>k$"):with_noremap():with_desc("edit: Break this line and move right content to next line"),
	["n|<A-Up>"] = map_cmd(":m -2<CR>"):with_desc("edit: Move this line up"),
	["n|<A-Down>"] = map_cmd(":m +1<CR>"):with_desc("edit: Move this line down"),
	["n|<leader><Up>"] = map_cmd("yyP"):with_desc("edit: Yank line and paste below"),
	["n|<leader><Down>"] = map_cmd("yyp"):with_desc("edit: Yank line and paste down"),
	-- ["n|<C-y>"] = map_cmd("yiw"):with_desc("edit: Yank in word"),
	["n|<C-p>"] = map_cmd("viwP"):with_desc("edit: Paste to override in word"),
	-- Insert mode
	["i|<C-d>"] = map_cmd("ddi"):with_noremap():with_silent():with_desc("Clear current line"),
	-- ["i|<C-z>"] = map_cmd("ui"):with_noremap():with_silent():with_desc("Undo"),
	["i|<C-k>"] = map_cmd("<C-o>D"):with_noremap():with_silent():with_desc("Delete content behind block"),
	-- Command mode
	["c|<C-t>"] = map_cmd("<C-R>=expand('%:p:h') . '/' <CR>"):with_noremap():with_silent():with_desc("fill absolute path"),
}
-- custom }}}1


-- NOTE: This function is special! Keymaps defined here are ONLY effective in buffers with LSP(s) attached
-- NOTE: Make sure to include `:with_buffer(buf)` to limit the scope of your mappings.
---@param buf number @The effective bufnr
mappings["lsp"] = function(buf)
	return {
		-- Example
		["n|K"] = require("keymap.bind").map_cr("Lspsaga hover_doc"):with_buffer(buf):with_desc("lsp: Show doc"),
	}
end

return mappings
