local commands = {
  BufEnter = {
    {
      pattern = "*.go",
      callback = function(event)
        vim.bo[event.buf].expandtab = false
      end,
    },
    {
      pattern = "*.hs,*.js,*.lua",
      callback = function(event)
        vim.bo[event.buf].shiftwidth = 2
        vim.bo[event.buf].softtabstop = 2
        vim.bo[event.buf].tabstop = 2
      end,
    },
  },
  TermOpen = {
    {
      pattern = "*",
      callback = function()
        local win = vim.api.nvim_get_current_win()

        vim.wo[win].number = false
        vim.wo[win].relativenumber = false
        vim.wo[win].signcolumn = "no"
      end,
    },
  },
}

return {
  setup = function()
    for kind, specs in pairs(commands) do
      for _, spec in pairs(specs) do
        vim.api.nvim_create_autocmd(kind, spec)
      end
    end
  end,
}
