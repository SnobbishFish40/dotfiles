-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

-- Block Ex mode
vim.keymap.set("n", "Q", "<nop>")

-- Shortcut for yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "[Y]ank to system clipboard" })

-- Make file in buffer executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "chmod +[x]" })

-- Shortcut to nvim theme selection
vim.keymap.set({ "n" }, "<leader>T", "<cmd>:Telescope colorscheme<CR>", { desc = "Open [t]heme menu" })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Open diagnostic quickfix list
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Paste from yank register when pasting over text
-- Ensures yanked text isn't overwritten
vim.keymap.set({ "n", "v" }, "<leader>p", '"0p', { desc = "[P]aste from yank register" })

-- Keybinds to make split navigation easier
-- Use CTRL+<hjkl> to switch between windows
-- See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Navigate quickfix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Search and replace word under cursor
vim.keymap.set(
	"n",
	"<leader>r",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Search and [r]eplace" }
)

-- Keep indent block selected for further indents in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Unindent and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and reselect" })

-- Move visual selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Toggle breakindent and wrapping
vim.keymap.set("n", "<leader>tw", function()
	-- Check the current local value for the window
	local is_enabled = vim.wo.breakindent

	if is_enabled then
		vim.wo.breakindent = false
		vim.wo.wrap = false
		print("Visual wrap: OFF")
	else
		vim.wo.breakindent = true
		vim.wo.wrap = true
		vim.wo.linebreak = true
		vim.opt.showbreak = "↳ "
		print("Visual wrap: ON")
	end
end, { desc = "[T]oggle breakindent/[w]rap" })

-- Toggle todo markdown file
vim.keymap.set("n", "<leader>td", function()
	local todo_file = vim.fn.getcwd() .. "/TODO.md"
	local buf_exists = false
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.api.nvim_buf_get_name(buf) == todo_file then
			vim.api.nvim_win_close(win, false)
			buf_exists = true
		end
	end
	if not buf_exists then
		vim.cmd("vsplit " .. todo_file)
		vim.cmd("vertical resize 40")
	end
end, { desc = "[T]oggle to[d]o list" })
