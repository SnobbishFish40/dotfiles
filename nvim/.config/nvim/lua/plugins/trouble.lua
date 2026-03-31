return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	keys = {
		{ "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", desc = "[T]oggle Diagnostics (Trouble)" },
		{ "<leader>tT", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "[T]oggle Buffer Diagnostics (Trouble)" },
		{ "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "[T]oggle [S]ymbols (Trouble)" },
	},
}
