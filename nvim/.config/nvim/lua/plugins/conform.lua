return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = function()
		-- Per-machine overrides, from the untracked `lua/local/conform.lua`.
		-- May set `disable_filetypes` and/or `formatters_by_ft`.
		local ok, overrides = pcall(require, "local.conform")
		if not (ok and type(overrides) == "table") then
			overrides = {}
		end

		-- Disable "format_on_save lsp_fallback" for languages that don't
		-- have a well standardized coding style. You can add additional
		-- languages here or re-enable it for the disabled ones.
		local disable_filetypes =
			vim.tbl_extend("force", { c = true, cpp = true }, overrides.disable_filetypes or {})

		return {
			notify_on_error = false,
			format_on_save = function(bufnr)
				if disable_filetypes[vim.bo[bufnr].filetype] then
					return nil
				else
					return {
						timeout_ms = 500,
						lsp_format = "fallback",
					}
				end
			end,
			formatters_by_ft = vim.tbl_extend("force", {
				lua = { "stylua" },
				python = { "ruff_format", "ruff_fix" },
			}, overrides.formatters_by_ft or {}),
		}
	end,
}
