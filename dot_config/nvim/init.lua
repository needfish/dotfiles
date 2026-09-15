--[[
  Neovim configuration
  Managed with lazy.nvim
]]

-- Load core settings
require("config.options")
require("config.keymaps")

-- Disable automatic newline comment continuation
local augroup = vim.api.nvim_create_augroup("erock.cfg", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup,
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- Load plugin manager & plugins
require("config.lazy")

-- Apply colorscheme (github_light)
-- Switch back: vim.cmd.colorscheme("ayu-dark")
vim.cmd.colorscheme("github_light")

