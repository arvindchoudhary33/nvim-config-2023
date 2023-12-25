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
	-- {
	-- 	"bluz71/vim-moonfly-colors",
	-- 	name = "moonfly",
	-- 	lazy = false,
	-- 	priority = 1000,
	--
	-- 	config = function()
	-- 		vim.g.moonflyTransparent = true
	-- 	end,
	-- },
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nightflyTransparent = false
		end,
	},
}
