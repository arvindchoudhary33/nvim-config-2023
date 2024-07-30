return {
	-- tools
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				-- python
				"ruff-lsp",
				"pyright",
				"stylua",
				"selene",
				"luacheck",
				"shellcheck",
				"shfmt",
				"typescript-language-server",
				"css-lsp",
			})
		end,
	},
	-- change null-ls config
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "mason.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			local mason_registry = require("mason-registry")
			local null_ls = require("null-ls")
			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics
			local code_actions = null_ls.builtins.code_actions

			null_ls.setup({
				-- debug = true, -- Turn on debug for :NullLsLog
				debug = false,
				-- diagnostics_format = "#{m} #{s}[#{c}]",
				sources = {
					-- list of supported sources:
					-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md

					-- get from $PATH
					diagnostics.ruff,
					diagnostics.mypy,
					formatting.black,

					-- get from mason
					formatting.stylua.with({
						command = mason_registry.get_package("stylua").path,
						extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
					}),
					formatting.shfmt.with({
						command = mason_registry.get_package("shfmt").path,
					}),
					formatting.prettierd.with({
						command = mason_registry.get_package("prettierd").path,
					}),
					formatting.rustfmt.with({
						command = mason_registry.get_package("rustfmt").path,
					}),
					formatting.yamlfix.with({
						command = mason_registry.get_package("yamlfix").path, -- requires python
					}),

					diagnostics.yamllint.with({
						command = mason_registry.get_package("yamllint").path,
					}),

					code_actions.shellcheck.with({
						command = mason_registry.get_package("shellcheck").path,
					}),
				},
			})
		end,
	},

	-- lsp servers
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = true },
			---@type lspconfig.options
			servers = {
				cssls = {},
				tailwindcss = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
				},
				tsserver = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
					single_file_support = false,
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "literal",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = false,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},
				html = {},
				yamlls = {
					settings = {
						yaml = {
							keyOrdering = false,
						},
					},
				},
				lua_ls = {
					-- enabled = false,
					single_file_support = true,
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								workspaceWord = true,
								callSnippet = "Both",
							},
							misc = {
								parameters = {
									-- "--log-level=trace",
								},
							},
							hint = {
								enable = true,
								setType = false,
								paramType = true,
								paramName = "Disable",
								semicolon = "Disable",
								arrayIndex = "Disable",
							},
							doc = {
								privateName = { "^_" },
							},
							type = {
								castNumberToInteger = true,
							},
							diagnostics = {
								disable = { "incomplete-signature-doc", "trailing-space" },
								-- enable = false,
								groupSeverity = {
									strong = "Warning",
									strict = "Warning",
								},
								groupFileStatus = {
									["ambiguity"] = "Opened",
									["await"] = "Opened",
									["codestyle"] = "None",
									["duplicate"] = "Opened",
									["global"] = "Opened",
									["luadoc"] = "Opened",
									["redefined"] = "Opened",
									["strict"] = "Opened",
									["strong"] = "Opened",
									["type-check"] = "Opened",
									["unbalanced"] = "Opened",
									["unused"] = "Opened",
								},
								unusedLocalExclude = { "_*" },
							},
							format = {
								enable = false,
								defaultConfig = {
									indent_style = "space",
									indent_size = "2",
									continuation_indent_size = "2",
								},
							},
						},
					},
				},
			},
			setup = {},
		},
	},
}
