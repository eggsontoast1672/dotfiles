local servers = {
  clangd = {},
  hls = {
    settings = {
      haskell = {
        plugin = {
          semanticTokens = {
            globalOn = true,
          },
        },
      },
    },
  },
  rust_analyzer = {},
}

local function setup_completion(client, buffer)
  if not client:supports_method("textDocument/completion") then
    return
  end

  vim.lsp.completion.enable(true, client.id, buffer, { autotrigger = true })

  vim.keymap.set("i", "<c-space>", vim.lsp.completion.get, { buffer = buffer })
  vim.keymap.set("i", "<tab>", function()
    return vim.fn.pumvisible() == 1 and "<c-y>" or "<tab>"
  end, { buffer = buffer, expr = true })
end

local function setup_formatting(client, buffer)
  if not client:supports_method("textDocument/formatting") then
    return
  end

  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = buffer,
    callback = function()
      vim.lsp.buf.format({ bufnr = buffer, id = client.id, timeout_ms = 1000 })
    end,
  })
end

for server, config in pairs(servers) do
  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    vim.keymap.set("n", "gd", vim.lsp.buf.definition)

    setup_completion(client, args.buf)
    setup_formatting(client, args.buf)
  end,
})

vim.diagnostic.config({ virtual_text = true })
