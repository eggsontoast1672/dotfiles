local cmp = require("cmp")
local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local keymaps = require("config.lsp.keymaps")

local M = {}

M.setup_completion = function()
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
end

M.setup_keymaps = function()
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      for _, keymap in pairs(keymaps) do
        vim.keymap.set("n", keymap.lhs, keymap.rhs, { buffer = args.buf })
      end
    end,
  })
end

M.setup_mason = function()
  mason.setup()
  mason_lspconfig.setup()
  mason_lspconfig.setup_handlers({
    function(server)
      lspconfig[server].setup({})
    end,
  })
end

return M
