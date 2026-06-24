-- Core keymaps
local map = vim.keymap.set

-- Better escape from insert mode
map("i", "jk", "<Esc>", { desc = "Escape insert mode" })

-- Clear search highlights (double-tap Esc to avoid interfering with other mappings)
map("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights (double-tap)" })

-- Toggle search highlight on/off
map("n", "<leader>/", "<cmd>set hlsearch!<CR>", { desc = "Toggle search highlights" })

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
map("n", "<leader>w", ":w ", { desc = "Save file (type name to save as)" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- Buffer navigation (tab-like)
map("n", "[b", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
map("n", "]b", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
-- NOTE: <S-h>/<S-l> override Vim's H/L (top/bottom of screen).
-- Remove these two lines if you use H/L for screen navigation.
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })

-- Copy relative filepath to clipboard
map("n", "<leader>y", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "Copy relative path" })

-- Escape terminal mode with Esc
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Escape terminal mode" })

-- Quick terminal (Snacks) -- toggle a persistent shell in a bottom split
map("n", "<leader>t", "", { desc = "+terminal" })
map("n", "<leader>tt", function() Snacks.terminal.toggle() end, { desc = "Toggle terminal" })

-- Run current file in a floating terminal
map("n", "<leader>tr", function()
  local ft = vim.bo.filetype
  local file = vim.fn.expand("%:p")
  local cmd
  if ft == "python" then
    cmd = "python " .. file
  elseif ft == "lua" then
    cmd = "lua " .. file
  elseif ft == "javascript" or ft == "typescript" then
    cmd = "node " .. file
  elseif ft == "rust" then
    cmd = "cargo run"
  elseif ft == "sh" then
    cmd = "bash " .. file
  else
    cmd = file  -- try raw path (requires shebang)
  end
  Snacks.terminal.toggle(cmd, { interactive = false })
end, { desc = "Run current file" })

-- Floating shell (for one-off commands)
map("n", "<leader>tf", function()
  Snacks.terminal.toggle(vim.o.shell, { win = { style = "terminal" } })
end, { desc = "Floating terminal" })

-- Vertical split terminal
map("n", "<leader>tv", function()
  Snacks.terminal.toggle(nil, { win = { position = "right" } })
end, { desc = "Vertical terminal" })

-- Run test suite
map("n", "<leader>tn", function()
  local ft = vim.bo.filetype
  local cmd
  if ft == "python" then
    cmd = "pytest"
  elseif ft == "javascript" or ft == "typescript" or ft == "javascriptreact" or ft == "typescriptreact" then
    cmd = "npm test"
  elseif ft == "rust" then
    cmd = "cargo test"
  elseif ft == "lua" then
    cmd = "busted"
  else
    cmd = vim.o.shell
  end
  Snacks.terminal.toggle(cmd, { interactive = false })
end, { desc = "Run test suite" })
