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
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Command completion
opt.wildmode = { "lastused", "full" }

-- Cursor & scrolling
opt.cursorline = true
opt.scrolloff = 10
opt.sidescrolloff = 8

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.winborder = "rounded"

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
opt.pumheight = 15

-- Mouse support (scroll, resize, select with mouse)
opt.mouse = "a"

-- Show tabs and trailing whitespace
opt.list = true
opt.listchars = { tab = "> ", trail = "-", precedes = "<", extends = ">" }

-- Don't wrap long lines by default
opt.wrap = false
opt.breakindent = true

-- No ~ characters on empty lines (cleaner look)
opt.fillchars:append({ eob = " " })

-- Hide mode text (already shown in lualine)
opt.showmode = false

-- Netrw (disabled -- snacks.explorer replaces it)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
