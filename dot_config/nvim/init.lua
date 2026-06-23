--[[
  Neovim configuration
  Managed with lazy.nvim
]]

-- Load core settings
require("config.options")
require("config.keymaps")

-- Load plugin manager & plugins
require("config.lazy")

-- Apply colorscheme (ayu dark variant)
vim.cmd.colorscheme("ayu-dark")
