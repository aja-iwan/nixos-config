return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		version = false,
		build = ":TSUpdate",
    -- stylua: ignore start
    config = function()
      require("nvim-treesitter").install({
        "bash", "c", "diff", "html", "javascript", "jsdoc", "json", "lua", "luadoc", "luap",
        "markdown", "markdown_inline", "printf", "python", "query", "regex", "toml", "tsx",
        "typescript", "vim", "vimdoc", "xml", "yaml",
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "sh", "bash", "c", "diff", "html", "javascript", "json", "lua", "markdown",
          "python", "query", "toml", "typescript", "typescriptreact", "vim", "help", "xml", "yaml",
        },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
		-- stylua: ignore end
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		opts = {
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		},
	},
}
