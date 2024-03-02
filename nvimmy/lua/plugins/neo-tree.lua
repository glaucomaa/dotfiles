return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", "<cmd>Neotree filesystem toggle left<CR>", { desc = "Toggle NeoTree" })
		vim.keymap.set("n", "<leader>e", "<cmd>Neotree filesystem focus left<CR>", { desc = "Toggle NeoTree" })
		vim.keymap.set("n", "<leader>fb", "<cmd>Neotree buffers reveal float<CR>", { desc = "Find buffers" })
	end,
}
