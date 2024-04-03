local cmp = require("cmp")
local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local keymaps = require("config.lsp.keymaps")

local function setup_formatting(buffer)
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = buffer,
    callback = function()
      vim.lsp.buf.format({
        filter = function(client)
          -- Not all clients support formatting, this ensures that neovim will
          -- not raise an error if that is the case
          return client.server_capabilities.documentFormattingProvider
        end,
      })
    end,
  })
end

local function setup_keymaps(buffer)
  for _, keymap in pairs(keymaps) do
    vim.keymap.set("n", keymap.lhs, keymap.rhs, { buffer = buffer })
  end
end

local M = {}

M.setup_on_attach = function()
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      setup_formatting(args.buf)
      setup_keymaps(args.buf)
    end,
  })
end

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

M.setup_mason = function()
  mason.setup()
  mason_lspconfig.setup()
  mason_lspconfig.setup_handlers({
    function(server)
      lspconfig[server].setup({})
    end,
  })

  lspconfig.gdscript.setup({})
end

return M
