return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "tokyonight"
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    version = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "bash", "c", "diff", "html", "javascript", "jsdoc", "json",
        "lua", "luadoc", "luap", "markdown", "markdown_inline", "printf",
        "python", "query", "regex", "toml", "tsx", "typescript",
        "vim", "vimdoc", "xml", "yaml",
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "sh", "bash", "c", "diff", "html", "javascript", "json", "lua",
          "markdown", "python", "query", "toml", "typescript",
          "typescriptreact", "vim", "help", "xml", "yaml",
        },
        callback = function() vim.treesitter.start() end,
      })
    end,
  },
}
