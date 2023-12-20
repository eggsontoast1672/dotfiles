-- TODO:
-- Set up auto formatting for Haskell files using vim.lsp.buf.format()
-- Set tab size to 2 for Haskell files

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

local function setup_options()
  vim.opt.clipboard = "unnamedplus"
  vim.opt.colorcolumn = "80"
  vim.opt.completeopt = "menu"
  vim.opt.cursorline = true
  vim.opt.expandtab = true
  vim.opt.guicursor = "i:block"
  vim.opt.hlsearch = false
  vim.opt.laststatus = 2
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.scrolloff = 5
  vim.opt.shiftwidth = 4
  vim.opt.showmode = false
  vim.opt.signcolumn = "yes"
  vim.opt.smartindent = true
  vim.opt.softtabstop = 4
  vim.opt.splitbelow = true
  vim.opt.splitright = true
  vim.opt.tabstop = 4
  vim.opt.termguicolors = true
  vim.opt.wrap = false
end

require("config.keymaps").setup()

setup_options()

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
