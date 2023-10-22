local function setup_keymaps()
  vim.g.mapleader = " "
  local keymaps = require("config.keymaps").basic
  for _, keymap in pairs(keymaps) do
    vim.keymap.set(keymap[1], keymap[2], keymap[3])
  end
end

local function setup_options()
  vim.opt.clipboard = "unnamedplus"
  vim.opt.colorcolumn = "80"
  vim.opt.completeopt = "menu"
  vim.opt.expandtab = true
  vim.opt.guicursor = "i:block"
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.scrolloff = 5
  vim.opt.shiftwidth = 2
  vim.opt.signcolumn = "yes"
  vim.opt.smartindent = true
  vim.opt.softtabstop = 2
  vim.opt.splitbelow = true
  vim.opt.splitright = true
  vim.opt.tabstop = 2
  vim.opt.termguicolors = true
  vim.opt.wrap = false
end

setup_keymaps()

require("config.tools").setup_lazy("config.plugins")

function buffer_set_tab_width(buffer, amount)
  vim.bo[buffer].shiftwidth = amount
  vim.bo[buffer].softtabstop = amount
  vim.bo[buffer].tabstop = amount
end

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.go",
  callback = function(event)
    vim.bo[event.buf].expandtab = false
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.lua",
  callback = function(event)
    buffer_set_tab_width(event.buf, 2)
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
  end,
})

vim.cmd.colorscheme("gruvbox")

setup_options()

require("config.lsp").setup()
