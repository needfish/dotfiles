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

-- Apply colorscheme (ayu-dark)
-- Switch back: vim.cmd.colorscheme("monokai")
vim.cmd.colorscheme("ayu-dark")

-- Catppuccin-style LSP semantic token highlights
-- Colors from Catppuccin Mocha (dark flavor)
local function set_semantic_highlights()
  local hl = vim.api.nvim_set_hl
  -- Types
  hl(0, "@lsp.type.class",       { fg = "#f9e2af" })  -- Yellow
  hl(0, "@lsp.type.struct",      { fg = "#f9e2af" })  -- Yellow
  hl(0, "@lsp.type.enum",        { fg = "#f9e2af" })  -- Yellow
  hl(0, "@lsp.type.function",    { fg = "#cba6f7" })  -- Mauve
  hl(0, "@lsp.type.method",      { fg = "#89b4fa" })  -- Blue
  hl(0, "@lsp.type.parameter",   { fg = "#fab387" })  -- Peach
  hl(0, "@lsp.type.variable",    { fg = "#cdd6f4" })  -- Text
  hl(0, "@lsp.type.property",    { fg = "#a6e3a1" })  -- Green
  hl(0, "@lsp.type.namespace",   { fg = "#94e2d5" })  -- Teal
  hl(0, "@lsp.type.interface",   { fg = "#cba6f7" })  -- Mauve
  hl(0, "@lsp.type.typeParameter", { fg = "#f5c2e7" }) -- Pink
  hl(0, "@lsp.type.decorator",   { fg = "#a6e3a1" })  -- Green
  hl(0, "@lsp.type.keyword",     { fg = "#f38ba8" })  -- Red
  hl(0, "@lsp.type.macro",       { fg = "#fab387" })  -- Peach
  hl(0, "@lsp.type.string",      { fg = "#a6e3a1" })  -- Green
  hl(0, "@lsp.type.number",      { fg = "#fab387" })  -- Peach
  hl(0, "@lsp.type.boolean",     { fg = "#fab387" })  -- Peach
  hl(0, "@lsp.type.operator",    { fg = "#89dceb" })  -- Sky

  -- Modifiers (subtle styling layered on top of types)
  hl(0, "@lsp.mod.readonly",     { italic = true })
  hl(0, "@lsp.mod.static",       { italic = true })
  hl(0, "@lsp.mod.abstract",     { italic = true })
  hl(0, "@lsp.mod.defaultLibrary", { fg = "#6c7086" }) -- Overlay0 (dim)
  hl(0, "@lsp.mod.deprecated",   { strikethrough = true, fg = "#6c7086" })
end

set_semantic_highlights()

-- Reapply on colorscheme change (so switching themes doesn't lose them)
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_semantic_highlights,
})
