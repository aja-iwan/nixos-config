return {
  {
    "nvim-mini/mini.pairs",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.pairs").setup({
        modes = { insert = true, command = true, terminal = false },
        skip_unbalanced = true,
        markdown = true,
      })
    end,
  },
  {
    "saghen/blink.cmp",
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
      completion = { documentation = { auto_show = false } },
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
}
