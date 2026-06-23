-- Core keymaps
local map = vim.keymap.set

-- Better escape from insert mode
map("i", "jk", "<Esc>", { desc = "Escape insert mode" })

-- Clear search highlights (double-tap Esc to avoid interfering with other mappings)
map("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights (double-tap)" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Better indenting
map("v", "<", "<gv", { desc = "Indent left and re-select" })
map("v", ">", ">gv", { desc = "Indent right and re-select" })

-- Move lines (visual mode)
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Better paste (keep yank buffer)
map("x", "p", [["_dP]], { desc = "Paste without overwriting yank" })

-- Quick save
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- Buffer navigation (tab-like)
map("n", "[b", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
map("n", "]b", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })

-- Escape terminal mode with Esc
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Escape terminal mode" })
