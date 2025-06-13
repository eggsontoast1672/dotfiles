return {
  "nvim-treesitter/nvim-treesitter",
  run = "<cmd>TSUpdate<cr>",
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
      },
    })
  end,
}
