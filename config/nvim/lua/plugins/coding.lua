return {
  {
    "nvim-mini/mini.pairs",
    version = false,
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    config = function()
      require('mini.pairs').setup()
    end,
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      'saghen/blink.lib',
      'rafamadriz/friendly-snippets',
    },
    build = function()
      require('blink.cmp').build():pwait()
    end,
    opts = {
      keymap = {
        preset = 'default',
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Up>'] = false,
        ['<Down>'] = false,
      },
      completion = { documentation = { auto_show = false } },
      sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
      fuzzy = { implementation = "lua" }
    },
  },
}
