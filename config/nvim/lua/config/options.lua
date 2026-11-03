local opt = vim.opt

-- Umum
opt.autowrite = true
opt.clipboard = "unnamedplus"
opt.confirm = true
opt.mouse = "a"
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 100
opt.updatetime = 200

-- Tampilan
opt.conceallevel = 0
opt.cursorline = true
opt.laststatus = 3
opt.linebreak = true
opt.list = true
opt.number = true
opt.relativenumber = true
opt.ruler = false
opt.scrolloff = 2
opt.showmode = false
opt.sidescrolloff = 4
opt.signcolumn = "yes"
opt.smoothscroll = true
opt.termguicolors = true
opt.wrap = true

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
vim.g.netrw_keepdir = 1
vim.g.netrw_sort_sequence = [[[\/]$,*]]
vim.g.netrw_bufsettings = "noma nomod nu nornu nowrap ro nobl"
