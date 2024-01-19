local M = {}

local servers = {
  "clangd",
  "clojure_lsp",
  "cmake",
  "gopls",
  "hls",
  "pyright",
  "rust_analyzer",
  "tsserver",
}

local keymaps = {
  { lhs = "<leader>a", rhs = vim.lsp.buf.code_action },
  { lhs = "<leader>gd", rhs = vim.lsp.buf.definition },
  { lhs = "<leader>k", rhs = vim.lsp.buf.hover },
  { lhs = "<leader>r", rhs = vim.lsp.buf.rename },
  { lhs = "]d", rhs = vim.diagnostic.goto_next },
  { lhs = "[d", rhs = vim.diagnostic.goto_prev },
}

local semantic_filetypes = {
  "c",
  "cpp",
  "rust",
}

local function buffer_use_semantic(buffer)
  for _, filetype in pairs(semantic_filetypes) do
    if vim.bo[buffer].filetype == filetype then
      return true
    end
  end
  return false
end

local function enable_lsp_formatting(buffer)
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = buffer,
    callback = function()
      vim.lsp.buf.format()
    end,
  })
end

return {
  setup = function()
    local lspconfig = require("lspconfig")
    for _, server in pairs(servers) do
      lspconfig[server].setup({})
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        for _, keymap in pairs(keymaps) do
          vim.keymap.set("n", keymap.lhs, keymap.rhs, { buffer = bufnr })
        end

        if vim.bo[args.buf].filetype == "haskell" then
          enable_lsp_formatting(args.buf)
        end

        -- if not buffer_use_semantic(args.buf) then
        --   local client = vim.lsp.get_client_by_id(args.data.client_id)
        --   client.server_capabilities.semanticTokensProvider = nil
        -- end
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
  end,
}
