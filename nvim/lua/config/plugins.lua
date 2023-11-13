return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = require("config.catppuccin").setup,
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/vim-vsnip" },
  { "mhartington/formatter.nvim" },
  { "morhetz/gruvbox" },
  { "navarasu/onedark.nvim" },
  { "neovim/nvim-lspconfig" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      pcall(vim.cmd.TSUpdate)
    end,
    config = require("config.treesitter").setup,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>f", "<cmd>Telescope find_files<cr>" },
      { "<leader>/", "<cmd>Telescope live_grep<cr>" },
    },
  },
}
