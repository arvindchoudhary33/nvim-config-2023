return {
	{
		"rose-pine/neovim",
		name = "rose-pine",

		priority = 1000,
		config = true,
		opts = {
			disable_italics = true,
			disable_background = true,
			disable_float_background = true,
		},
	},
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = {
		transparent_mode = true,
	} },

	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	--
	-- 	config = function()
	-- 		require("kanagawa").setup({
	-- 			globalStatus = true,
	-- 			overrides = function(colors)
	-- 				return {
	-- 					FloatBorder = { bg = "NONE" },
	-- 					NormalFloat = { bg = "NONE" },
	-- 					LineNr = { bg = "NONE" },
	-- 					SignColumn = { bg = "NONE" },
	-- 					FloatTitle = { bg = "NONE" },
	-- 				}
	-- 			end,
	-- 		})
	-- 		vim.cmd.colorscheme("kanagawa")
	-- 	end,
	-- },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
}
