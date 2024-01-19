local function setup_options(options)
  for option, value in pairs(options) do
    vim.opt[option] = value
  end
end

local function setup_globals(globals)
  for global, value in pairs(globals) do
    vim.g[global] = value
  end
end

local function setup_servers(servers)
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  for _, server in pairs(servers) do
    lspconfig[server].setup({
      capabilities = capabilities,
    })
  end
end

return {
  setup = function(config)
    if config.options then
      setup_options(config.options)
    end
    if config.globals then
      setup_globals(config.globals)
    end  
    if config.colorscheme then
      vim.cmd.colorscheme(config.colorscheme)
    end
    if config.servers then
      setup_servers(config.servers)
    end
  end,
}
