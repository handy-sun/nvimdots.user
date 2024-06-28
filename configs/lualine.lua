local ui_icon = require("modules.utils.icons").get("ui", true)

local custom = {
	sep = {
		function()
			return "|"
		end,
		padding = 0,
		separator = { left = "", right = "" },
	},

	date_icon = {
		function ()
			return ui_icon.Fire
		end,
		padding = 0,
		separator = { left = "", right = "" },
	},

	bomb = {
		function()
			if vim.api.nvim_get_option_value("bomb", { scope = "local" }) == true then
				return "[BOM]"
			else
				return ""
			end
		end,
	},

	shift_tab_value = {
		function()
			local et_flag = "»"
			if vim.api.nvim_get_option_value("expandtab", { scope = "local" }) == true then
				et_flag = "•"
			end

			return string.format("%d %s %d",
				vim.api.nvim_get_option_value("shiftwidth", { scope = "local" }),
				et_flag,
				vim.api.nvim_get_option_value("tabstop", { scope = "local" })
			)
		end,
		padding = 1,
	},

	file_location = {
		function()
			local cursorline = vim.fn.line(".")
			local virtual_col = vim.fn.virtcol(".")
			local real_col = vim.fn.col(".")
			local filelines = vim.fn.line("$")
			local position

			if cursorline == 1 then
				position = "Top"
			elseif cursorline == filelines then
				position = "Bot"
			else
				position = string.format("%2d%%%%", math.floor(cursorline / filelines * 100))
			end

			if real_col == virtual_col then
				return string.format("%s %3d,%2d", position, cursorline, real_col)
			else
				return string.format("%s %3d,%2d-%-2d", position, cursorline, real_col, virtual_col)
			end
		end,
	},
}

return {
	sections = {
		lualine_b = function(defaults)
			return {
				{
					'filename',
					file_status = false,
					-- Display new file status (new file means no write after created)
					newfile_status = false,
					-- 0: Just the filename 1: Relative path 2: Absolute path 3: Absolute path, with tilde as the home directory
					-- 4: Filename and parent dir, with tilde as the home directory
					path = 1,
					shorting_target = 30,
				},
				defaults[1],
				defaults[2],
			}
		end,

		lualine_x = function(defaults)
			return {
				defaults[1],
				custom.bomb,
				{
					"fileformat",
					symbols = {
						unix = '', -- e712
						dos = '',  -- e70f
						mac = '',  -- e711
					},
					padding = 1,
				},
				custom.sep,
				custom.shift_tab_value,
			}
		end,

		lualine_z = function()
			return {
				custom.file_location,
				custom.date_icon,
				{
					'datetime',
					style = "%H:%M",
					padding = { right = 1 },
				},
			}
		end,
	},
}
-- end

