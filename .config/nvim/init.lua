--  _       _ _     _             
-- (_)_ __ (_) |_  | |_   _  __ _ 
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|                               

local function buffer_set_tab_width(buffer, amount)
  vim.bo[buffer].shiftwidth = amount
  vim.bo[buffer].softtabstop = amount
  vim.bo[buffer].tabstop = amount
end

local function setup_colorscheme()
  vim.cmd.colorscheme("melange")
  -- vim.cmd([[
  --   highlight Normal ctermbg=none guibg=none
  --   highlight VertSplit ctermbg=none guibg=none
  -- ]])
end

require("config.keymaps").setup()
require("config.options").setup()

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.go",
  callback = function(event)
    vim.bo[event.buf].expandtab = false
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.hs,*.lua",
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

-- Set these up last because they are the most likely to fail. If my plugins or
-- lsp config fail to load, I still want my options and autocommands to be set
-- correctly.
require("config.tools").setup_lazy("config.plugins")
require("config.statusline").setup()
require("config.lsp").setup()
require("config.format").setup()

-- However, the colorscheme must be initialized after the plugins, because I
-- might using a plugin colorscheme.
setup_colorscheme()
