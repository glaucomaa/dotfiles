return {}
-- return {
--     "nvimtools/none-ls.nvim",
--     config = function()
--         local null_ls = require("null-ls")
--         null_ls.setup({
--             sources = {
--                 null_ls.builtins.formatting.stylua,
--                 null_ls.builtins.formatting.ruff_lsp,
--                 -- null_ls.builtins.formatting.isort,
--                 null_ls.builtins.code_actions.ruff_lsp
--             },
--         })
--
--         vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "LSP format" })
--     end,
-- }
