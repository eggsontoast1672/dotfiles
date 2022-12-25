local tabsize = 2

vim.o.colorcolumn = "80"
vim.o.expandtab = true
vim.o.guicursor = "i:block"
vim.o.hidden = false
vim.o.laststatus = 3
vim.o.list = true
vim.o.mouse = "a"
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.shiftwidth = tabsize
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = tabsize
vim.o.termguicolors = true
vim.o.wrap = false

vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set listchars+=eol:↴")
