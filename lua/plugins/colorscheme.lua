vim.g.edge_transparent_background = 2

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
			transparent = false,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	{ "sainnhe/gruvbox-material", lazy = false, priority = 1000 },
	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
	},
	{ "sainnhe/edge", lazy = false, priority = 1000 },
	{ "savq/melange-nvim" },
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_enable_italic = true
			vim.g.everforest_transparent_background = true
			-- vim.cmd.colorscheme("everforest")
		end,
	},
}
