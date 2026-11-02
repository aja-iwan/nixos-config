local opt = vim.opt

-- Umum
opt.autowrite = true
opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus"
opt.confirm = true
opt.mouse = "a"
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200

-- Tampilan
opt.conceallevel = 2
opt.cursorline = true
opt.laststatus = 3
opt.linebreak = true
opt.list = true
opt.number = true
opt.relativenumber = true
opt.ruler = false
opt.scrolloff = 4
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smoothscroll = true
opt.termguicolors = true
opt.wrap = false

-- Indentasi dan format
opt.expandtab = true
opt.formatoptions = "jcroqlnt"
opt.shiftround = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2

-- Folding
opt.foldlevel = 99
opt.foldmethod = "indent"
opt.foldtext = ""

-- Pencarian
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.smartcase = true

-- Window dan navigasi
opt.jumpoptions = "view"
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.virtualedit = "block"
opt.winminwidth = 5

-- Completion
opt.completeopt = "menu,menuone,noselect"
opt.pumblend = 10
opt.pumheight = 10
opt.wildmode = "longest:full,full"

-- Ejaan
opt.spelllang = { "en" }

-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0
vim.g.netrw_bufsettings = "noma nomod nu nornu nowrap ro nobl"
vim.g.netrw_hide = 1
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]
vim.g.netrw_sort_sequence = [[[\/]$,*]]
vim.g.netrw_keepdir = 1

local group = vim.api.nvim_create_augroup("netrw_ui", { clear = true })
local header = "%#Title# (Netrw) %#Directory#%<%{fnamemodify(get(b:, 'netrw_curdir', ''), ':~')}"
  .. "%=%#Comment# l Open | h Back | a New | . Hidden | r Rename | x Delete | Q Close %*"

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "netrw",
  callback = function(ev)
    vim.schedule(function()
      local win = vim.fn.bufwinid(ev.buf)
      if win == -1 then
        return
      end
      vim.wo[win].number = true
      vim.wo[win].relativenumber = false
      vim.wo[win].signcolumn = "no"
      vim.wo[win].cursorline = true
      vim.wo[win].cursorlineopt = "line"
      vim.wo[win].winhighlight = "CursorLine:Visual"
      vim.wo[win].winbar = header
    end)
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = group,
  callback = function(ev)
    if vim.bo[ev.buf].filetype == "netrw" or vim.bo[ev.buf].buftype ~= "" then
      return
    end
    local wo = vim.wo
    wo.number, wo.relativenumber = true, true
    wo.signcolumn, wo.winbar, wo.winhighlight = "yes", "", ""
  end,
})
