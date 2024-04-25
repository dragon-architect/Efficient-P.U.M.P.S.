----------------------
---- settings.lua ----
----------------------

-- Make settings
data:extend({
	{
		type = "int-setting",
		name = "efficient-pumps-rescale-power-factor",
		setting_type = "startup",
		default_value = 1,
		allowed_values = {1, 10, 100},
		order = "aa"
	},
	{
		type = "bool-setting",
		name = "efficient-pumps-rescale-fluid-pump",
		setting_type = "startup",
		default_value = false,
		order = "ab"
	},
	{
		type = "bool-setting",
		name = "efficient-pumps-inefficient-burner",
		setting_type = "startup",
		default_value = false,
		order = "ac"
	},
})