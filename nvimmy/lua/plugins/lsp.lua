return {}
-- return {
--
--
-- 	{
-- 		"williamboman/mason.nvim",
-- 		lazy = false,
-- 		config = function()
-- 			require("mason").setup()
-- 		end,
-- 	},
-- 	{
-- 		"williamboman/mason-lspconfig.nvim",
-- 		lazy = false,
-- 		opts = {
-- 			--auto_install = true,
-- 			ensure_installed = { "lua_ls", "pyright", "rust_analyzer" },
-- 		},
-- 	},
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		lazy = false,
-- 		config = function()
-- 			local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
-- 			local lspconfig = require("lspconfig")
-- 			--lspconfig.tsserver.setup({
-- 			--  capabilities = capabilities
-- 			--})
-- 			--lspconfig.html.setup({
-- 			--  capabilities = capabilities
-- 			--})
--             local on_attach = function(client, bufnr)
--           -- Enable completion triggered by <c-x><c-o>
--           vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--           -- Mappings.
--           -- See `:help vim.lsp.*` for documentation on any of the below functions
--             vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, {noremap=true, silent=true, buffer=bufnr, desc = "Lsp hover" })
-- 			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {noremap=true, silent=true, buffer=bufnr, desc = "Definition" })
-- 			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {noremap=true, silent=true, buffer=bufnr, desc = "Reference" })
-- 			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {noremap=true, silent=true, buffer=bufnr, desc = "Code Action" })
-- 			vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {noremap=true, silent=true, buffer=bufnr, desc = "LSP rename" })
-- 			vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, {noremap=true, silent=true, buffer=bufnr, desc = "LSP signature" })
--
--           -- local bufopts = { noremap=true, silent=true, buffer=bufnr, }
--           -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--           -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--           -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--           -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--           -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--           -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--           -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--           -- vim.keymap.set('n', '<space>wl', function()
--           --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--           -- end, bufopts)
--           -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--           -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--           -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--           -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--           -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
--         end
--
-- 			lspconfig.lua_ls.setup({
-- 				capabilities = capabilities,
--                 on_attach = on_attach,
-- 			})
--             lspconfig.pyright.setup({
-- 				capabilities = capabilities,
--                 on_attach = on_attach,
--                 autostart = false,
-- 			})
-- 			lspconfig.ruff_lsp.setup({
-- 				capabilities = capabilities,
--                 on_attach = on_attach,
-- 			})
-- 			lspconfig.rust_analyzer.setup({
-- 				capabilities = capabilities,
-- 				filetypes = { "rust" },
--
-- 				-- root_dir = util.root_pattern("Cargo.toml"),
-- 				settings = {
-- 					["rust-analyzer"] = {
-- 						cargo = {
-- 							allFeatures = true,
-- 						},
-- 					},
-- 				},
-- 			})
--
--          -- vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, {noremap=true, silent=true, buffer=bufnr, desc = "Lsp hover" })
-- 			-- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {noremap=true, silent=true, buffer=bufnr, desc = "Definition" })
-- 			-- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {noremap=true, silent=true, buffer=bufnr, desc = "Reference" })
-- 			-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {noremap=true, silent=true, buffer=bufnr, desc = "Code Action" })
-- 			-- vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {noremap=true, silent=true, buffer=bufnr, desc = "LSP rename" })
-- 			-- vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, {noremap=true, silent=true, buffer=bufnr, desc = "LSP signature" })
-- 		end,
-- 	},
-- }