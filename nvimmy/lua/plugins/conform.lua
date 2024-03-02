return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				python = { "isort", "black" },
				-- Use a sub-list to run only the first available formatter
				--javascript = { { "prettierd", "prettier" } },
			},
		})
	end,
}
