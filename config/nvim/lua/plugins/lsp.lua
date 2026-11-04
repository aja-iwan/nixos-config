return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
			{ "mason-org/mason-lspconfig.nvim", config = function() end },
		},
		config = function()
			-- Diagnostik
			vim.diagnostic.config({
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				virtual_text = { spacing = 4, source = "if_many", prefix = "●" },
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "✘",
						[vim.diagnostic.severity.WARN] = "▲",
						[vim.diagnostic.severity.HINT] = "⚑",
						[vim.diagnostic.severity.INFO] = "»",
					},
				},
			})

			-- Keymap, inlay hints, dan folding
			local inlay_exclude = { "vue" }

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
				callback = function(ev)
					local buf = ev.buf
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					if not client then
						return
					end

					-- method (opsional)
					local function map(mode, lhs, rhs, desc, method, extra)
						if method and not client:supports_method(method, buf) then
							return
						end
						vim.keymap.set(
							mode,
							lhs,
							rhs,
							vim.tbl_extend("force", { buffer = buf, desc = desc }, extra or {})
						)
					end

					map("n", "<leader>cl", "<cmd>checkhealth vim.lsp<CR>", "Lsp Info")
					map("n", "gd", vim.lsp.buf.definition, "Goto Definition", "textDocument/definition")
					map("n", "gr", vim.lsp.buf.references, "References", nil, { nowait = true })
					map("n", "gI", vim.lsp.buf.implementation, "Goto Implementation")
					map("n", "gy", vim.lsp.buf.type_definition, "Goto Type Definition")
					map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
					map("n", "G", vim.lsp.buf.hover, "Hover", "textDocument/hover")
					map("n", "gG", vim.lsp.buf.signature_help, "Signature Help", "textDocument/signatureHelp")
					map("i", "<C-g>", vim.lsp.buf.signature_help, "Signature Help", "textDocument/signatureHelp")
					map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action", "textDocument/codeAction")
					map("n", "<leader>cr", vim.lsp.buf.rename, "Rename", "textDocument/rename")
					map("n", "<leader>cf", function()
						vim.lsp.buf.format()
					end, "Format", "textDocument/formatting")
					map("n", "<leader>cA", function()
						vim.lsp.buf.code_action({ context = { only = { "source" }, diagnostics = {} } })
					end, "Source Action", "textDocument/codeAction")
					map("n", "<leader>co", function()
						vim.lsp.buf.code_action({
							apply = true,
							context = { only = { "source.organizeImports" }, diagnostics = {} },
						})
					end, "Organize Imports", "textDocument/codeAction")

					-- Inlay hints
					if
						client:supports_method("textDocument/inlayHint", buf)
						and vim.bo[buf].buftype == ""
						and not vim.tbl_contains(inlay_exclude, vim.bo[buf].filetype)
					then
						vim.lsp.inlay_hint.enable(true, { bufnr = buf })
					end

					-- Folding dari LSP
					if client:supports_method("textDocument/foldingRange", buf) then
						local win = vim.api.nvim_get_current_win()
						vim.wo[win][0].foldmethod = "expr"
						vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
					end
				end,
			})

			-- Server
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = { globals = { "vim" } },
							workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
							codeLens = { enable = true },
							completion = { callSnippet = "Replace" },
							doc = { privateName = { "^_" } },
							hint = {
								enable = true,
								setType = false,
								paramType = true,
								paramName = "Disable",
								semicolon = "Disable",
								arrayIndex = "Disable",
							},
						},
					},
				},
			}

			for name, cfg in pairs(servers) do
				vim.lsp.config(name, cfg)
			end

			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
				automatic_enable = { exclude = { "stylua" } },
			})
		end,
	},

	-- mason.nvim
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<CR>", desc = "Mason" } },
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
			local mr = require("mason-registry")
			local tools = { "stylua", "shfmt" }

			mr:on("package:install:success", function()
				vim.defer_fn(function()
					vim.api.nvim_exec_autocmds("FileType", { buffer = vim.api.nvim_get_current_buf() })
				end, 100)
			end)

			mr.refresh(function()
				for _, tool in ipairs(tools) do
					local ok, pkg = pcall(mr.get_package, tool)
					if ok and not pkg:is_installed() then
						pkg:install()
					end
				end
			end)
		end,
	},

	-- conform.nvim
	{
		"stevearc/conform.nvim",
		dependencies = { "mason-org/mason.nvim" },
		event = "BufWritePre",
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format()
				end,
				mode = { "n", "x" },
				desc = "Format",
			},
			{
				"<leader>cF",
				function()
					require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
				end,
				mode = { "n", "x" },
				desc = "Format injected",
			},
		},
		opts = {
			default_format_opts = {
				timeout_ms = 3000,
				lsp_format = "fallback",
			},
			format_on_save = {
				timeout_ms = 3000,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				fish = { "fish_indent" },
				sh = { "shfmt" },
			},
			formatters = {
				injected = { options = { ignore_errors = true } },
			},
		},
	},
}
