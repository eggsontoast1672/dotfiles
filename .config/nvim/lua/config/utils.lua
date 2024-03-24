local autocmds = require("config.autocmds")
local keymaps = require("config.keymaps")
local options = require("config.options")

local M = {}

M.setup_autocmds = function()
  for kind, specs in pairs(autocmds) do
    for _, spec in pairs(specs) do
      vim.api.nvim_create_autocmd(kind, spec)
    end
  end
end

M.setup_keymaps = function()
	vim.g.mapleader = " "
	for _, keymap in pairs(keymaps) do
		vim.keymap.set(keymap.mode, keymap.lhs, keymap.rhs)
	end
end

M.setup_options = function()
  for option, value in pairs(options) do
    vim.opt[option] = value
  end
end

return M
