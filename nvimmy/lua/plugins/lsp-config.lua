return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
		dependencies = {
			-- Plugin and UI to automatically install LSPs to stdpath
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			"hrsh7th/cmp-nvim-lsp",
			-- Install none-ls for diagnostics, code actions, and formatting
			"nvimtools/none-ls.nvim",

			-- Install neodev for better nvim configuration and plugin authoring via lsp configurations
			"folke/neodev.nvim",

			-- Progress/Status update for LSP
			{ "j-hui/fidget.nvim", tag = "legacy" },
		},
		config = function()
			local null_ls = require("null-ls")
			-- local map_lsp_keybinds = require("user.keymaps").map_lsp_keybinds -- Has to load keymaps before pluginslsp

			-- Use neodev to configure lua_ls in nvim directories - must load before lspconfig
			require("neodev").setup()

			-- Setup mason so it can manage 3rd party LSP servers
			require("mason").setup({
				ui = {
					border = "rounded",
				},
			})

			-- Configure mason to auto install servers
			require("mason-lspconfig").setup({
				ensure_installed = { "marksman", "lua_ls", "rust_analyzer", "ruff_lsp", "pyright", "clangd" },
				-- automatic_installation = { exclude = { "ocamllsp", "gleam" } },
			})

			-- Override tsserver diagnostics to filter out specific messages
			-- local messages_to_filter = {
			-- 	"This may be converted to an async function.",
			-- 	"'_Assertion' is declared but never used.",
			-- 	"'__Assertion' is declared but never used.",
			-- 	"The signature '(data: string): string' of 'atob' is deprecated.",
			-- 	"The signature '(data: string): string' of 'btoa' is deprecated.",
			-- }

			-- local function tsserver_on_publish_diagnostics_override(_, result, ctx, config)
			-- 	local filtered_diagnostics = {}
			--
			-- 	for _, diagnostic in ipairs(result.diagnostics) do
			-- 		local found = false
			-- 		for _, message in ipairs(messages_to_filter) do
			-- 			if diagnostic.message == message then
			-- 				found = true
			-- 				break
			-- 			end
			-- 		end
			-- 		if not found then
			-- 			table.insert(filtered_diagnostics, diagnostic)
			-- 		end
			-- 	end
			--
			-- 	result.diagnostics = filtered_diagnostics
			--
			-- 	vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
			-- end

			-- LSP servers to install (see list here: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers )
			local servers = {
				-- bashls = {},
				clangd = {
					keys = {
						{ "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
					},
					root_dir = function(fname)
						return require("lspconfig.util").root_pattern(
							"Makefile",
							"configure.ac",
							"configure.in",
							"config.h.in",
							"meson.build",
							"meson_options.txt",
							"build.ninja"
						)(fname) or require("lspconfig.util").root_pattern(
							"compile_commands.json",
							"compile_flags.txt"
						)(fname) or require("lspconfig.util").find_git_ancestor(fname)
					end,
					capabilities = {
						offsetEncoding = { "utf-16" },
					},
					cmd = {
						"clangd",
						"--background-index",
						"--clang-tidy",
						"--header-insertion=iwyu",
						"--completion-style=detailed",
						"--function-arg-placeholders",
						"--fallback-style=llvm",
					},
					init_options = {
						usePlaceholders = true,
						completeUnimported = true,
						clangdFileStatus = true,
					},
				},
				-- cssls = {},
				-- gleam = {},
				-- graphql = {},
				-- html = {},
				rust_analyzer = {},
				jsonls = {},
				lua_ls = {
					settings = {
						Lua = {
							workspace = { checkThirdParty = false },
							telemetry = { enabled = false },
						},
					},
				},
				ruff_lsp = {
					keys = {
						{
							"<leader>co",
							function()
								vim.lsp.buf.code_action({
									apply = true,
									context = {
										only = { "source.organizeImports" },
										diagnostics = {},
									},
								})
							end,
							desc = "Organize Imports",
						},
					},
				},
				marksman = {},
				--
				-- nil_ls = {},
				-- ocamllsp = {},
				-- prismals = {},
				pyright = {},
				-- solidity = {},
				sqlls = {},
				-- tailwindcss = {
				-- filetypes = { "reason" },
				-- },
				-- tsserver = {
				-- 	settings = {
				-- 		experimental = {
				-- 			enableProjectDiagnostics = true,
				-- 		},
				-- 	},
				-- 	handlers = {
				-- 		["textDocument/publishDiagnostics"] = vim.lsp.with(
				-- 			tsserver_on_publish_diagnostics_override,
				-- 			{}
				-- 		),
				-- 	},
				-- },
				-- yamlls = {},
			}

			-- Default handlers for LSP
			local default_handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
			}

			-- nvim-cmp supports additional completion capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local default_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			---@diagnostic disable-next-line: unused-local
			local on_attach = function(_client, buffer_number)
				-- Pass the current buffer to map lsp keybinds
				-- map_lsp_keybinds(buffer_number)
				vim.keymap.set(
					"n",
					"<leader>lh",
					vim.lsp.buf.hover,
					{ noremap = true, silent = true, buffer = buffer_number, desc = "Lsp hover" }
				)
				vim.keymap.set(
					"n",
					"<leader>gd",
					vim.lsp.buf.definition,
					{ noremap = true, silent = true, buffer = buffer_number, desc = "Definition" }
				)
				vim.keymap.set(
					"n",
					"<leader>gr",
					vim.lsp.buf.references,
					{ noremap = true, silent = true, buffer = buffer_number, desc = "Reference" }
				)
				vim.keymap.set(
					"n",
					"<leader>ca",
					vim.lsp.buf.code_action,
					{ noremap = true, silent = true, buffer = buffer_number, desc = "Code Action" }
				)
				vim.keymap.set(
					"n",
					"<leader>lr",
					vim.lsp.buf.rename,
					{ noremap = true, silent = true, buffer = buffer_number, desc = "LSP rename" }
				)
				vim.keymap.set(
					"n",
					"<leader>ls",
					vim.lsp.buf.signature_help,
					{ noremap = true, silent = true, buffer = buffer_number, desc = "LSP signature" }
				)

				-- Create a command `:Format` local to the LSP buffer
				-- vim.api.nvim_buf_create_user_command(buffer_number, "Format", function(_)
				-- 	vim.lsp.buf.format({
				-- 		filter = function(format_client)
				-- 			-- Use Prettier to format TS/JS if it's available
				-- 			return format_client.name ~= "tsserver" or not null_ls.is_registered("prettier")
				-- 		end,
				-- 	})
				-- end, { desc = "LSP: Format current buffer with LSP" })

				-- if client.server_capabilities.codeLensProvider then
				-- 	vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "CursorHold" }, {
				-- 		buffer = buffer_number,
				-- 		callback = vim.lsp.codelens.refresh,
				-- 		desc = "LSP: Refresh code lens",
				-- 		group = vim.api.nvim_create_augroup("codelens", { clear = true }),
				-- 	})
				-- end
			end

			-- Iterate over our servers and set them up
			for name, config in pairs(servers) do
				require("lspconfig")[name].setup({
					capabilities = default_capabilities,
					filetypes = config.filetypes,
					handlers = vim.tbl_deep_extend("force", {}, default_handlers, config.handlers or {}),
					on_attach = on_attach,
					settings = config.settings,
				})
			end

			-- Congifure LSP linting, formatting, diagnostics, and code actions
			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics
			local code_actions = null_ls.builtins.code_actions

			null_ls.setup({
				border = "rounded",
				sources = {
					-- formatting
					-- formatting.prettierd,
					formatting.stylua,
					formatting.black,
					-- formatting.ocamlformat,

					-- diagnostics
					-- diagnostics.eslint_d.with({
					-- 	condition = function(utils)
					-- 		return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" })
					-- 	end,
					-- }),

					-- code actions
					-- code_actions.eslint_d.with({
					-- 	condition = function(utils)
					-- 		return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" })
					-- 	end,
					-- }),
				},
			})

			-- Configure borderd for LspInfo ui
			require("lspconfig.ui.windows").default_options.border = "rounded"

			-- Configure diagostics border
			vim.diagnostic.config({
				float = {
					border = "rounded",
				},
			})
			vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "LSP format" })
		end,
	},
	{
		"p00f/clangd_extensions.nvim",
		lazy = true,
		config = function() end,
		opts = {
			inlay_hints = {
				inline = false,
			},
			ast = {
				--These require codicons (https://github.com/microsoft/vscode-codicons)
				role_icons = {
					type = "",
					declaration = "",
					expression = "",
					specifier = "",
					statement = "",
					["template argument"] = "",
				},
				kind_icons = {
					Compound = "",
					Recovery = "",
					TranslationUnit = "",
					PackExpansion = "",
					TemplateTypeParm = "",
					TemplateTemplateParm = "",
					TemplateParamObject = "",
				},
			},
		},
	},
}
