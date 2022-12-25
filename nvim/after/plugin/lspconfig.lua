local servers = {
  "pyright",
  "rust_analyzer",
  "sumneko_lua",
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers,
})

vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- TODO: Make these maps apply to bufnr
local on_attach = function(_, bufnr)
  local on_attach_set_keymap = function(lhs, rhs)
    vim.keymap.set("n", lhs, rhs, { buffer = bufnr })
  end

  on_attach_set_keymap("<leader>ca", vim.lsp.buf.code_action)
  on_attach_set_keymap("gd", vim.lsp.buf.definition)
  on_attach_set_keymap("K", vim.lsp.buf.hover)
  on_attach_set_keymap("<leader>rn", vim.lsp.buf.rename)
  on_attach_set_keymap("<C-k>", vim.lsp.buf.signature_help)
end

local capabilities = require("cmp_nvim_lsp")
  .default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require("lspconfig")
for _, server in pairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

local runtime_path = vim.split(package.path, ';')

table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      runtime = {
        path = runtime_path,
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
        library = {
          "${3rd}/love2d/library",
        },
      },
    },
  },
})

local cmp = require("cmp")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<tab>"] = cmp.mapping.confirm({ select = true }),
  }),
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
  }),
})

require("fidget").setup({
  window = {
    border = "rounded",
  },
})
