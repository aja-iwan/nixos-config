return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			spec = {
				{ "<MiddleMouse>", mode = { "n", "i", "v", "o" }, hidden = true },
				{ "<Left>", mode = { "n", "i", "v" }, hidden = true },
				{ "<Right>", mode = { "n", "i", "v" }, hidden = true },
				{ "<Up>", mode = { "n", "i", "v" }, hidden = true },
				{ "<Down>", mode = { "n", "i", "v" }, hidden = true },
				{ "<C-z>", mode = { "n", "i", "v" }, hidden = true },
				{ "<C-s>", mode = { "i", "v" }, hidden = true },
				{ "q", mode = { "n", "v" }, hidden = true },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer local keymaps",
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
				topdelete = { text = "^" },
				changedelete = { text = "*" },
				untracked = { text = "?" },
			},
			signs_staged = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
				topdelete = { text = "^" },
				changedelete = { text = "*" },
				untracked = { text = "!" },
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		version = false,
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>r", builtin.oldfiles, { desc = "Telescope oldfiles" })
			vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "Telescope help tags" })
		end,
	},
}
