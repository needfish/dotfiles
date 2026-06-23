-- Neovim global options
local opt = vim.opt

-- Leader key (spacebar)
vim.g.mapleader = " "

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Cursor & scrolling
opt.cursorline = true
opt.scrolloff = 10
opt.sidescrolloff = 8

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.colorcolumn = "80"

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Undo / backup
opt.undofile = true
opt.swapfile = false
opt.backup = false

-- Clipboard (uses system clipboard)
opt.clipboard = "unnamedplus"

-- Decrease update time / make responsive
opt.updatetime = 250
opt.timeoutlen = 300

-- Better completion
opt.completeopt = "menu,menuone,noselect"

-- Netrw (disabled -- telescope-file-browser replaces it)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
