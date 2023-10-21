function setup_treesitter()
  require("nvim-treesitter.configs").setup({
    highlight = {
      enable = false,
    },
  })
end

return {
  {
    "blazkowolf/gruber-darker.nvim",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
  },
  {
    "hrsh7th/cmp-vsnip",
    dependencies = {
      "hrsh7th/vim-vsnip",
    },
  },
  {
    "morhetz/gruvbox",
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      pcall(vim.cmd.TSUpdate)
    end,
    config = setup_treesitter,
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
