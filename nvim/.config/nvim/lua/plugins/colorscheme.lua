-- Active theme selection
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyDone",
	callback = function()
		vim.cmd.colorscheme("rose-pine")
		-- Theme overrides
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- Transparent bg
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	end,
})

-- Theme installs and configs
return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				styles = {
					comments = { italic = false }, -- Disable italics in comments
				},
			})
		end,
	},

	{
		"nyoom-engineering/oxocarbon.nvim",
		priority = 1000,
		config = function()
			vim.opt.background = "dark"
		end,
	},

	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = false,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
		end,
	},

	{
		"erikbackman/brightburn.vim",
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				styles = {
					italic = false,
				},
			})
		end,
	},
}
