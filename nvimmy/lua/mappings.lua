vim.keymap.set("n", "<leader>s", "<cmd>w<CR>", { desc = "Save file" })
--
vim.keymap.set("n", "<ESC>", "<ESC><cmd>noh<CR>")
vim.keymap.set("i", "jk", "<ESC>")

vim.keymap.set("n", "n", "nzzzv")

vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("v", "gg", "gg0")
vim.keymap.set("v", "G", "G$")

vim.keymap.set('n',"<leader>rn","<cmd>set invrelativenumber<CR>", {desc="Toggle relative number"})
--vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>', {noremap = true,desc="comment"})
--
--
--

-- function SetPythonHostProg()
--     local python_path = vim.fn.system('which python')
--     vim.g.python3_host_prog = python_path
-- end
-- 
-- vim.cmd("autocmd FileType python nnoremap <buffer> <leader>ve :lua SetPythonHostProg()<CR>")






