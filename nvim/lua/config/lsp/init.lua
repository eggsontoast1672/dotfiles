local function setup_keymaps(buffer)
  local function set_keymap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, {
      buffer = buffer,
    })
  end

  set_keymap("n", "]d", vim.diagnostic.goto_next)
  set_keymap("n", "[d", vim.diagnostic.goto_prev)
  set_keymap("n", "<leader>a", vim.lsp.buf.code_action)
  set_keymap("n", "gd", vim.lsp.buf.definition)
  set_keymap("n", "<leader>r", vim.lsp.buf.rename)
end

local function setup_formatting(buffer)
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = buffer,
    callback = function()
      vim.lsp.buf.format()
    end,
  })
end

local ok, servers = pcall(require, "config.lsp.servers")
if not ok then
  return
end

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local _, settings = pcall(require, "config.lsp.settings")
for _, server in pairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
    settings = settings,
  })
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    setup_keymaps(args.buf)
    setup_formatting(args.buf)
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
    { name = "nvim_lsp_signature_help" },
    { name = "nvim_lsp" },
    { name = "vsnip" },
  },
})
