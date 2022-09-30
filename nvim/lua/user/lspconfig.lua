local cmp_status_ok, cmp = pcall(require, "cmp")

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
  }, {
    { name = "buffer" },
  }),
})

local on_attach = function(client, bufnr)
  vim.keymap.set("n", "K", vim.lsp.buf.hover)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename)
  vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help)
end

local servers = { "pyright" }
local capabilities = require("cmp_nvim_lsp").update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

for _, server in pairs(servers) do
  require("lspconfig")[server].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end
