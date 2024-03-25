local M = {
  BufWritePre = {
    {
      callback = function()
        -- Looks cryptic, but just trims trailing whitespace on save by
        -- replacing any amount of whitespace at the end of a line with
        -- nothing. The 'e' at the end prevents it from erroring when it didn't
        -- match anything.
        vim.cmd([[:%s/\s\+$//e]])
      end,
    },
  },
  TermOpen = {
    {
      callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
      end,
    },
  },
  TextYankPost = {
    {
      callback = function()
        vim.highlight.on_yank()
      end,
    },
  },
}

return M
