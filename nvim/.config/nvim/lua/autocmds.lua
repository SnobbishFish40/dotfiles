-- [[ Basic Autocommands ]]
-- See `:help lua-guide-autocommands`

-- Open files on the same line they were closed on
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = { "*" },
	callback = function()
		if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
			vim.api.nvim_exec2("normal! g'\"", { output = false })
		end
	end,
})

-- Force all help pages to open as a vertical split
vim.api.nvim_create_autocmd("BufWinEnter", {
	desc = "Force help pages to open on vertical split",
	group = vim.api.nvim_create_augroup("help-vertical", { clear = true }),
	pattern = "*.txt",
	callback = function()
		if vim.bo.buftype == "help" then
			vim.cmd("wincmd L")
			vim.cmd("vertical resize 80")
		end
	end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
