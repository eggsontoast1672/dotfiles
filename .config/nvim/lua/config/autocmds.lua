return {
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
