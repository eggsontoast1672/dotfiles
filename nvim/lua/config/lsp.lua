local servers = {
  "clangd",
  "hls",
  -- "lua_ls", -- Disabled since it is very slow
  "ols",
  "omnisharp",
  "rust_analyzer",
  -- "texlab",
  "zls",
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

for _, server in pairs(servers) do
  local ok, config = pcall(require, "config.lsp-configs." .. server)
  vim.lsp.enable(server)
  vim.lsp.config(server, ok and config or {})
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
