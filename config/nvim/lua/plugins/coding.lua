return {
	{
		"nvim-mini/mini.pairs",
		version = false,
		event = "VeryLazy",
		opts = {
			modes = { insert = true, command = true, terminal = false },
			skip_unbalanced = true,
			markdown = true,
		},
	},
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "<leader>cc", "gcc", remap = true, desc = "Toggle comment" },
			{ "<leader>cc", "gc", mode = "v", remap = true, desc = "Toggle comment" },
		},
	},
	{
		"saghen/blink.cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"saghen/blink.lib",
			"rafamadriz/friendly-snippets",
			"L3MON4D3/LuaSnip",
		},
		build = function()
			require("blink.cmp").build():pwait()
		end,
		opts = {
			keymap = {
				preset = "default",
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<Up>"] = false,
				["<Down>"] = false,
				["<Right>"] = false,
				["<Left>"] = false,
			},
			completion = {
				accept = { auto_brackets = { enabled = true } },
				list = { selection = { preselect = false } },
				documentation = { auto_show = false },
				ghost_text = { enabled = true },
			},
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
			snippets = { preset = "luasnip" },
			fuzzy = { implementation = "lua" },
		},
	},
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		build = "make install_jsregexp",
		dependencies = {
			{
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
		},
	},
	{
		"nvim-mini/mini.surround",
		version = false,
		event = "VeryLazy",
		opts = {
			mappings = {
				add = "<leader>sa",
				delete = "<leader>sd",
				find = "<leader>sf",
				find_left = "<leader>sF",
				highlight = "<leader>sh",
				replace = "<leader>sr",
			},
		},
	},
}
