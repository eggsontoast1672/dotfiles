local M = {}

M.servers = {
  "clangd",
  "clojure_lsp",
  "cmake",
  "gopls",
  "pyright",
  "rust_analyzer",
  "tsserver",
}

M.keymaps = {
  { lhs = "<leader>a", rhs = vim.lsp.buf.code_action },
  { lhs = "<leader>gd", rhs = vim.lsp.buf.definition },
  { lhs = "<leader>k", rhs = vim.lsp.buf.hover },
  { lhs = "<leader>r", rhs = vim.lsp.buf.rename },
  { lhs = "]d", rhs = vim.diagnostic.goto_next },
  { lhs = "[d", rhs = vim.diagnostic.goto_prev },
}

M.setup = function()
  local lspconfig = require("lspconfig")
  for _, server in pairs(M.servers) do
    lspconfig[server].setup({})
  end

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      for _, keymap in pairs(M.keymaps) do
        vim.keymap.set("n", keymap.lhs, keymap.rhs, { buffer = bufnr })
      end

      -- I don't like semantic tokens right now, but I do in Rust.
      if vim.bo[args.buf].filetype ~= "rust" then
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil
      end
    end,
  })

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
end

return M
