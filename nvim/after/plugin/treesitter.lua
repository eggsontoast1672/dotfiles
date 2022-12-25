require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "markdown", "python", "rust" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})
