return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ['*'] = {
        keys = {
          -- Disable a keymap
          { "K",     false },
          { "gK",    false },
          { "<c-k>", false,                      mode = "i" },
          -- Add or change a keymap
          { "G",     vim.lsp.buf.hover,          desc = "Hover" },
          { "gG",    vim.lsp.buf.signature_help, desc = "Signature Help" },
          { "<c-g>", vim.lsp.buf.signature_help, desc = "Signature Help", mode = "i" },
        },
      },
    },
  },
}
