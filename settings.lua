-- Please check `lua/core/settings.lua` to view the full list of configurable settings
local settings = {}

-- If cannot connect to port 22, set false
settings["use_ssh"] = true

settings["format_on_save"] = false

-- Set it to false if there are no need to format on save.
---@type boolean
settings["format_on_save"] = false

-- Set it to false if the notification after formatting is annoying.
---@type boolean
settings["format_notify"] = false

-- settings["colorscheme"] = "melange"
-- Overwrite colorscheme to catppuccin-frappe
-- settings["colorscheme"] = "catppuccin"
settings["colorscheme"] = "catppuccin-frappe"

-- settings["transparent_background"] = true

-- Set the dashboard startup image here
-- You can generate the ascii image using: https://github.com/TheZoraiz/ascii-image-converter
-- More info: https://github.com/ayamir/nvimdots/wiki/Issues#change-dashboard-startup-image
---@type string[]
settings["dashboard_image"] = function() return {
	[[                                   ___          ]],
	[[                               ,-""   `.        ]],
	[[                             ,'  _   e )`-._    ]],
	[[                            /  ,' `-._<.===-'   ]],
	[[                           /  /                 ]],
	[[                          /  ;                  ]],
	[[              _.--.__    /   ;                  ]],
	[[ (`._    _.-""       "--'    |                  ]],
	[[ <_  `-""                     \                 ]],
	[[  <`-                          :                ]],
	[[   (__   <__.                  ;                ]],
	[[     `-.   '-.__.      _.'    /                 ]],
	[[        \      `-.__,-'    _,'                  ]],
	[[         `._    ,    /__,-'                     ]],
	[[            ""._\__,'< <____                    ]],
	[[                 | |  `----.`.                  ]],
	[[                 | |        \ `.                ]],
	[[                 ; |___      \-``               ]],
	[[                 \   --<                        ]],
	[[                  `.`.<                         ]],
	[[                    `-'                         ]],
}
end

return settings
