return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.config').setup({
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "python",
        "kotlin",
        "nix",
        "toml",
        "json"
      },
      highlight = {
        enable = true, 
      },
      indent = {
        enable = true,
      },
    })
  end,
}
