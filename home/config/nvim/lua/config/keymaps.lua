-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local set = vim.keymap.set

-- Normal, Insert, and Visual Mode
set({ "n", "i", "v" }, "<Up>", "<Nop>", { silent = true })
set({ "n", "i", "v" }, "<Down>", "<Nop>", { silent = true })
set({ "n", "i", "v" }, "<Left>", "<Nop>", { silent = true })
set({ "n", "i", "v" }, "<Right>", "<Nop>", { silent = true })

-- goto motions
set({ "n", "v" }, "gg", "<C-g>", { desc = "Show file info", silent = true })
set({ "n", "v" }, "gk", "gg", { desc = "Go to start of file", silent = true })
set({ "n", "v" }, "gj", "G", { desc = "Go to end of file", silent = true })
set({ "n", "v" }, "gh", "0", { desc = "Go to start of line", silent = true })
set({ "n", "v" }, "gl", "$", { desc = "Go to end of line", silent = true })
set({ "n", "v" }, "G", "<Nop>", { desc = "Disable standalone G", silent = true })

-- move lines
set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- better indenting
set("x", "H", "<gv", { silent = true })
set("x", "L", ">gv", { silent = true })

-- clear search and stop snippet on escape
set({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  LazyVim.cmp.actions.snippet_stop()
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- normal mode
set("n", "q", "<Nop>", { silent = true })
set("n", "Q", "<Nop>", { silent = true })
