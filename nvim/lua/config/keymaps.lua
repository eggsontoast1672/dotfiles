return {
  basic = {
    { "n", "<leader>ss", "<c-w>s<cmd>terminal<cr>i" },
    { "n", "<leader>sv", "<c-w>v<cmd>terminal<cr>i" },
    { "t", "<esc>", "<c-\\><c-n>" },
  },
  lsp = {
    { "<leader>a", vim.lsp.buf.code_action },
    { "<leader>gd", vim.lsp.buf.definition },
    { "<leader>k", vim.lsp.buf.hover },
    { "<leader>r", vim.lsp.buf.rename },
    { "]d", vim.diagnostic.goto_next },
    { "[d", vim.diagnostic.goto_prev },
  },
}
