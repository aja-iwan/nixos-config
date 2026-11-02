-- Nvi keymaps
local set = vim.keymap.set

-- File explorer
set("n", "<leader><leader>", "<cmd>Explore<CR>", { desc = "File explorer" })

-- Clear search and stop snippet on escape
set({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("nohlsearch")
  local ls = package.loaded["luasnip"]
  if ls and ls.expand_or_jumpable() then
    ls.unlink_current()
  end
  return "<esc>"
end, { expr = true, desc = "Escape and clear hlsearch" })

-- Disable arrow
set({ "n", "i", "v" }, "<Left>", "<Nop>", { silent = true, desc = "Disable left arrow" })
set({ "n", "i", "v" }, "<Down>", "<Nop>", { silent = true, desc = "Disable down arrow" })
set({ "n", "i", "v" }, "<Up>", "<Nop>", { silent = true, desc = "Disable up arrow" })
set({ "n", "i", "v" }, "<Right>", "<Nop>", { silent = true, desc = "Disable right arrow" })

-- Navigation ctrl
set({ "i", "v" }, "<C-h>", "<Left>", { silent = true, desc = "Move cursor left" })
set({ "i", "v" }, "<C-j>", "<Down>", { silent = true, desc = "Move cursor down" })
set({ "i", "v" }, "<C-k>", "<Up>", { silent = true, desc = "Move cursor up" })
set({ "i", "v" }, "<C-l>", "<Right>", { silent = true, desc = "Move cursor right" })

-- Move to window
set("n", "<C-h>", "<C-w>h", { silent = true, desc = "Go to left window" })
set("n", "<C-j>", "<C-w>j", { silent = true, desc = "Go to lower window" })
set("n", "<C-k>", "<C-w>k", { silent = true, desc = "Go to upper window" })
set("n", "<C-l>", "<C-w>l", { silent = true, desc = "Go to right window" })

-- Move lines
set("n", "J", ":m .+1<CR>==", { silent = true, desc = "Move line down" })
set("n", "K", ":m .-2<CR>==", { silent = true, desc = "Move line up" })
set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })
set("n", "H", "<<", { silent = true, desc = "Unindent line" })
set("n", "L", ">>", { silent = true, desc = "Indent line" })
set("v", "H", "<gv", { silent = true, desc = "Unindent selection" })
set("v", "L", ">gv", { silent = true, desc = "Indent selection" })

-- Normal & Visual
set({ "n", "v" }, "r", "<C-r>", { silent = true, desc = "Redo" })
set({ "n", "v" }, "R", "r", { silent = true, desc = "Replace character" })
set({ "n", "v" }, "s", "*", { silent = true, desc = "Search word forward" })
set({ "n", "v" }, "S", "#", { silent = true, desc = "Search word backward" })
set({ "n", "v" }, "v", "<C-v>", { silent = true, desc = "Visual block mode" })
set({ "n", "v" }, "<C-v>", "v", { silent = true, desc = "Visual mode" })
set({ "n", "v" }, "<C-q>", "v", { silent = true, desc = "Visual mode" })
set({ "n", "v" }, "<C-w>q", "<cmd>q<CR>", { desc = "Quit" })
set({ "n", "v" }, "<C-w>w", "<cmd>w<CR>", { desc = "Write" })

-- Normal
set("n", "m", "o<Esc>", { silent = true, desc = "Insert empty line below" })
set("n", "M", "O<Esc>", { silent = true, desc = "Insert empty line above" })
set("n", "<C-r>", "R", { silent = true, desc = "Replace mode" })
set("n", "<C-s>", ":%s/", { desc = "Substitute" })
set("n", "z>", "zR", { silent = true, desc = "Open all folds" })
set("n", "z<", "zM", { silent = true, desc = "Close all folds" })
set("n", "Q", "<cmd>bdelete<CR>", { desc = "Close buffer" })
set("n", "{", "<cmd>bprevious<CR>", { silent = true, desc = "Previous buffer" })
set("n", "}", "<cmd>bnext<CR>", { silent = true, desc = "Next buffer" })

-- Insert
set("i", "<C-v>", "<C-o>v", { silent = true, desc = "Start visual mode from insert" })

-- Visual
set("x", "<C-p>", '"_dP', { silent = true, desc = "Paste without overwriting register" })

-- Operator
set("o", "w", "iw", { silent = true, desc = "Inner word" })

-- Goto
set({ "n", "v", "o" }, "gg", "%", { silent = true, desc = "Go to matching pair" })
set({ "n", "v", "o" }, "gh", "^", { silent = true, desc = "Go to start of line" })
set({ "n", "v", "o" }, "gj", "G", { silent = true, desc = "Go to end of file" })
set({ "n", "v", "o" }, "gk", "gg", { silent = true, desc = "Go to start of file" })
set({ "n", "v", "o" }, "gl", "$", { silent = true, desc = "Go to end of line" })

-- Nop
set({ "n", "v" }, "q", "<Nop>", { silent = true, desc = "Disable macro recording" })
set({ "i", "v" }, "<C-s>", "<Nop>", { silent = true, desc = "Disable <C-s>" })
set({ "n", "i", "v" }, "<C-z>", "<Nop>", { silent = true, desc = "Disable suspend" })

-- Netrw
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("netrw_keymaps", { clear = true }),
  pattern = "netrw",
  callback = function(ev)
    local function map(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, remap = true, silent = true, desc = desc })
    end
    map("l", "<CR>", "Open file or folder")
    map("h", "-", "Go up one folder")
    map(".", "gh", "Toggle dotfiles")
    map("a", "%", "New file")
    map("A", "d", "New folder")
    map("r", "R", "Rename")
    map("x", "D", "Delete")
    map("Q", "<cmd>bdelete<CR>", "Close explorer")
    map("<C-l>", "<C-w>l", "Go to right window")
  end,
})
