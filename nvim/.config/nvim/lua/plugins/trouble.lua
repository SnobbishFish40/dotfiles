return {
	"folke/trouble.nvim",
	opts = {
		focus = true,
		auto_preview = false,
	},
	cmd = "Trouble",
	keys = {
		{ "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", desc = "[T]oggle Diagnostics (Trouble)" },
		{
			"<leader>tT",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "[T]oggle Buffer Diagnostics (Trouble)",
		},
		{ "<leader>ts", "<cmd>Trouble symbols toggle focus=true<cr>", desc = "[T]oggle [S]ymbols (Trouble)" },
	},
}
