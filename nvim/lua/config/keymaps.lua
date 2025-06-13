local M = {
  { mode = "i", lhs = "jk", rhs = "<esc>" },
  { mode = "n", lhs = "<leader>e", rhs = vim.cmd.Explore },
  { mode = "n", lhs = "<leader>he", rhs = ":%!xxd<cr>" },
  { mode = "n", lhs = "<leader>hr", rhs = ":%!xxd -r<cr>" },
  { mode = "n", lhs = "<leader>ss", rhs = "<c-w>s<cmd>terminal<cr>i" },
  { mode = "n", lhs = "<leader>sv", rhs = "<c-w>v<cmd>terminal<cr>i" },
  { mode = "n", lhs = "<leader>w", rhs = vim.cmd.write },
  { mode = "t", lhs = "<esc>", rhs = "<c-\\><c-n>" },
}

return M
