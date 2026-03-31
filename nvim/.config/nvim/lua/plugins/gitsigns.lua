return {
	"lewis6991/gitsigns.nvim",
	---@module 'gitsigns'
	---@type Gitsigns.Config
	---@diagnostic disable-next-line: missing-fields
	opts = {
		signs = {
			add = { text = "+" }, ---@diagnostic disable-line: missing-fields
			change = { text = "~" }, ---@diagnostic disable-line: missing-fields
			delete = { text = "_" }, ---@diagnostic disable-line: missing-fields
			topdelete = { text = "‾" }, ---@diagnostic disable-line: missing-fields
			changedelete = { text = "-" }, ---@diagnostic disable-line: missing-fields
			untracked = { text = "?" }, ---@diagnostic disable-line: missing-fields
		},
		signs_staged = {
			add = { text = "|" }, ---@diagnostic disable-line: missing-fields
			change = { text = "|" }, ---@diagnostic disable-line: missing-fields
			delete = { text = "|" }, ---@diagnostic disable-line: missing-fields
			topdelete = { text = "|" }, ---@diagnostic disable-line: missing-fields
			changedelete = { text = "|" }, ---@diagnostic disable-line: missing-fields
			untracked = { text = "?" }, ---@diagnostic disable-line: missing-fields
		},
		signcolumn = true,
		signs_staged_enable = true,
		watch_gitdir = {
			follow_files = true,
		},
		auto_attach = true,
		attach_to_untracked = true,
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			map("n", "]c", function()
				gitsigns.nav_hunk("next")
			end, { desc = "Next git hunk" })
			map("n", "[c", function()
				gitsigns.nav_hunk("prev")
			end, { desc = "Previous git hunk" })
			map("n", "<leader>hS", gitsigns.stage_hunk, { desc = "Git [H]unk [S]tage" })
			map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Git [H]unk [R]eset" })
			map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Git [H]unk [P]review" })
			map("n", "<leader>hd", gitsigns.diffthis, { desc = "Git [H]unk [D]iff" })
			map("n", "<leader>hb", function()
				gitsigns.blame_line({ full = true })
			end, { desc = "Git [H]unk [B]lame" })
			map("n", "<leader>gb", gitsigns.toggle_current_line_blame, { desc = "[G]it [B]lame Toggle" })
			map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "[G]it [S]tage buffer" })
		end,
	},
}
