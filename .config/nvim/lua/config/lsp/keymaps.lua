return {
  { lhs = "<leader>a", rhs = vim.lsp.buf.code_action },
  { lhs = "gd", rhs = vim.lsp.buf.definition },
  { lhs = "K", rhs = vim.lsp.buf.hover },
  { lhs = "<leader>r", rhs = vim.lsp.buf.rename },
  { lhs = "]d", rhs = vim.diagnostic.goto_next },
  { lhs = "[d", rhs = vim.diagnostic.goto_prev },
}
