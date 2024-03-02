return {
	"lervag/vimtex",
	event = "VeryLazy",
	lazy = false,
	ft = { "tex" },
	config = function()
		vim.g.tex_flavor = "latex"
		-- vim.g.vimtex_quickfix_mode = 0
		-- vim.g.vimtex_mappings_enabled = 0
		-- vim.g.vimtex_indent_enabled = 0
		-- vim.g.vimtex_view_method = "zathura"
		-- vim.g.vimtex_context_pdf_viewer = "zathura"
		vim.keymap.set("n", "<leader>cc", "<cmd>VimtexCompile<CR>") --, { desc = "VimtexCompile" })
		vim.keymap.set("n", "<leader>cq", "<cmd>VimtexStop<CR>") --, { desc = "VimtexStop" })
		vim.keymap.set("n", "<leader>cv", "<cmd>VimtexView<CR>") --, { desc = "VimtexView" })
	end,
}
