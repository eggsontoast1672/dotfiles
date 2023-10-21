local function setup_keymaps()
  local keymaps = require("config.keymaps").basic
  for _, keymap in pairs(keymaps) do
    vim.keymap.set(keymap[1], keymap[2], keymap[3])
  end
end

vim.g.mapleader = " "

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

-- Cmp stuff

local cmp = require("cmp")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<tab>"] = cmp.mapping.confirm({ select = true }),
  }),
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    for _, keybind in pairs(require("config.keymaps").lsp) do
      vim.keymap.set("n", keybind[1], keybind[2], { buffer = event.buf })
    end
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = event.buf,
      callback = function(event)
        vim.lsp.buf.format()
      end,
    })
  end,
})

require("config").setup({
  colorscheme = "gruvbox",
  globals = {
    mapleader = " ",
  },
  options = {
    clipboard = "unnamedplus",
    colorcolumn = "80",
    completeopt = "menu",
    expandtab = true,
    guicursor = "i:block",
    number = true,
    relativenumber = true,
    scrolloff = 5,
    shiftwidth = 2,
    signcolumn = "yes",
    smartindent = true,
    softtabstop = 2,
    splitbelow = true,
    splitright = true,
    tabstop = 2,
    termguicolors = true,
    wrap = false,
  },
  servers = {
    "clangd",
    "gopls",
    "pyright",
    "rust_analyzer",
  },
})
