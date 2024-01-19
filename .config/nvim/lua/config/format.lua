local M = {}

M.setup = function()
  require("formatter").setup({
    filetype = {
      c = require("formatter.filetypes.c").astyle,
      cpp = require("formatter.filetypes.cpp").astyle,
      go = require("formatter.filetypes.go").gofmt,
      python = require("formatter.filetypes.python").black, 
      rust = require("formatter.filetypes.rust").rustfmt,
    },
  })

  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*",
    callback = function()
      -- FIXME: This function freaks out when the buffer is empty
      vim.cmd.FormatWrite()
    end,
  })
end

return M
