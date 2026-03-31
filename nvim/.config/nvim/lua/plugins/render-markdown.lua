return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
	keys = {
		-- Toggle markdown rendering
		{ "<leader>tm", "<cmd>RenderMarkdown toggle<cr>", desc = "[T]oggle [M]arkdown Rendering" },
	},
}
