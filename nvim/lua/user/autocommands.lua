local tab_size = vim.api.nvim_create_augroup("TabSize", {
  clear = true,
})

vim.api.nvim_create_autocmd("FileType", {
  group = tab_size,
  pattern = "lua",
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
  end,
})

local trailing_whitespace = vim.api.nvim_create_augroup("TrailingWhitespace", {
  clear = true,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  command = "%s/\\s\\+$//e",
  group = trailing_whitespace,
  pattern = "*",
})
