vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
--
vim.cmd("set clipboard=unnamedplus")
-- OR
-- vim.keymap.set({'n', 'x'}, 'gy', '"+y')
-- vim.keymap.set({'n', 'x'}, 'gp', '"+p')
--_
vim.keymap.set({ "n", "x" }, "x", '"_x')
vim.keymap.set({ "n", "x" }, "X", '"_d')

vim.g.mapleader = " "
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.keymap.set({ "n", "t" }, "<c-k>", "<C-\\><C-n> <cmd>wincmd k<CR>")
vim.keymap.set({ "n", "t" }, "<c-j>", "<C-\\><C-n> <cmd>wincmd j<CR>")
vim.keymap.set({ "n", "t" }, "<c-h>", "<C-\\><C-n> <cmd>wincmd h<CR>")
vim.keymap.set({ "n", "t" }, "<c-l>", "<C-\\><C-n> <cmd>wincmd l<CR>")

vim.keymap.set({ "t" }, "<c-d>", "<C-\\><C-n> <cmd>q<CR>")
vim.keymap.set({ "n" }, "<c-d>", "<C-\\><C-n> <cmd>q<CR>")
-- vim.cmd("set keymap=russian-jcukenwin")
vim.cmd(
	"set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
)

function ToggleKeyboardLayout()
	if vim.bo.keymap == "russian-jcukenwin" then
		vim.bo.keymap = ""
		print("Switched to English keyboard layout")
	else
		vim.bo.keymap = "russian-jcukenwin"
		print("Switched to Russian keyboard layout")
	end
end

vim.keymap.set(
	{ "n" },
	"<leader>cl",
	"<cmd>lua ToggleKeyboardLayout()<CR>",
	{ noremap = true, silent = true, desc = "Switch Language" }
)

function PrintKeymap()
	local keymap = vim.bo.keymap
	if keymap then
		print("Keymap for current buffer:")
		print("Mode:__" .. keymap .. "__")
	else
		print("No keymap found for current buffer.")
	end
end

vim.cmd("command! PrintKeymap lua PrintKeymap()")

vim.cmd("set splitright")
vim.cmd("set splitbelow")
