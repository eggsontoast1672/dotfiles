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
  local capabilities = client.server_capabilities
  if capabilities.semanticTokensProvider and capabilities.semanticTokensProvider.full then
    local augroup = vim.api.nvim_create_augroup("SemanticTokens", {})
    vim.api.nvim_create_autocmd("TextChanged", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.semantic_tokens_full()
      end,
    })
    vim.lsp.buf.semantic_tokens_full()
  end

  vim.keymap.set("n", "<space>f", vim.lsp.buf.format)
  vim.keymap.set("n", "K", vim.lsp.buf.hover)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename)
  vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help)
end

local servers = { "ccls", "pyright", "sumneko_lua" }
local capabilities = require("cmp_nvim_lsp").update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

for _, server in pairs(servers) do
  if server == "ccls" then
    require("lspconfig").ccls.setup({
      capabilities = capabilities,
      init_options = {
        diagnostics = {
          onChange = 1, -- for snappier feel
        },
      },
      on_attach = on_attach,
    })
  else
    require("lspconfig")[server].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end
end
