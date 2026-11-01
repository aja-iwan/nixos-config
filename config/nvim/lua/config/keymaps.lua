-- Nvi keymaps
local set = vim.keymap.set

-- File explorer
set("n", "<leader><leader>", "<cmd>Explore<CR>", { desc = "Explorer" })

-- Clear search and stop snippet on escape
set({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("nohlsearch")
  if vim.snippet.active() then
    vim.snippet.stop()
  end
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- Disable arrow
set({ "n", "i", "v" }, "<Left>", "<Nop>", { silent = true })
set({ "n", "i", "v" }, "<Down>", "<Nop>", { silent = true })
set({ "n", "i", "v" }, "<Up>", "<Nop>", { silent = true })
set({ "n", "i", "v" }, "<Right>", "<Nop>", { silent = true })

-- Navigation ctrl
set({ "i", "v" }, "<C-h>", "<Left>", { silent = true })
set({ "i", "v" }, "<C-j>", "<Down>", { silent = true })
set({ "i", "v" }, "<C-k>", "<Up>", { silent = true })
set({ "i", "v" }, "<C-l>", "<Right>", { silent = true })

-- Move to window
set("n", "<C-h>", "<C-w>h", { silent = true })
set("n", "<C-j>", "<C-w>j", { silent = true })
set("n", "<C-k>", "<C-w>k", { silent = true })
set("n", "<C-l>", "<C-w>l", { silent = true })

-- Move lines
set("n", "J", ":m .+1<CR>==", { silent = true })
set("n", "K", ":m .-2<CR>==", { silent = true })
set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
set("n", "H", "<<", { silent = true })
set("n", "L", ">>", { silent = true })
set("v", "H", "<gv", { silent = true })
set("v", "L", ">gv", { silent = true })

-- Normal & Visual
set({ "n", "v" }, "r", "<C-r>", { silent = true })
set({ "n", "v" }, "R", "r", { silent = true })
set({ "n", "v" }, "s", "*", { silent = true })
set({ "n", "v" }, "S", "#", { silent = true })
set({ "n", "v" }, "v", "<C-v>", { silent = true })
set({ "n", "v" }, "<C-v>", "v", { silent = true })
set({ "n", "v" }, "<C-q>", "<cmd>q<CR>", { desc = "Quit" })
set({ "n", "v" }, "<C-w>", "<cmd>w<CR>", { desc = "Write" })

-- Normal
set("n", "m", "o<Esc>", { silent = true })
set("n", "M", "O<Esc>", { silent = true })
set("n", "<C-r>", "R", { silent = true })
set("n", "<C-s>", ":%s/", { desc = "Substitute" })
set("n", "z>", "zR", { desc = "Open all folds", silent = true })
set("n", "z<", "zM", { desc = "Close all folds", silent = true })
set("n", "Q", "<cmd>bdelete<CR>", { desc = "Buffer close" })
set("n", "{", "<cmd>bprevious<CR>", { desc = "Buffer prev", silent = true })
set("n", "}", "<cmd>bnext<CR>", { desc = "Buffer next", silent = true })

-- Insert
set("i", "<C-v>", "<C-o>v", { silent = true })

-- Visual
set("x", "<C-p>", '"_dP', { silent = true })

-- Operator
set("o", "w", "iw", { desc = "Inner word", silent = true })

-- Goto
set({ "n", "v", "o" }, "gg", "%", { desc = "Go to matching pair", silent = true })
set({ "n", "v", "o" }, "gh", "^", { desc = "Go to start of line", silent = true })
set({ "n", "v", "o" }, "gj", "G", { desc = "Go to end of file", silent = true })
set({ "n", "v", "o" }, "gk", "gg", { desc = "Go to start of file", silent = true })
set({ "n", "v", "o" }, "gl", "$", { desc = "Go to end of line", silent = true })

-- Nop
set({ "n", "v" }, "q", "<Nop>", { silent = true })
set({ "i", "v" }, "<C-s>", "<Nop>", { silent = true })
set({ "n", "i", "v" }, "<C-z>", "<Nop>", { silent = true })

-- Netrw
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("netrw_keymaps", { clear = true }),
  pattern = "netrw",
  callback = function(ev)
    local function map(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, remap = true, silent = true, desc = desc })
    end
    map("l", "<CR>", "Buka file atau folder")
    map("h", "-", "Naik satu folder")
    map(".", "gh", "Tampilkan atau sembunyikan dotfiles")
    map("a", "%", "File baru")
    map("A", "d", "Folder baru")
    map("r", "R", "Ganti nama")
    map("x", "D", "Hapus")
    map("q", "<cmd>bdelete<CR>", "Tutup explorer")
    map("<C-l>", "<C-w>l", "Pindah ke window kanan")
  end,
})
