return {
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/vim-vsnip" },
  { "neovim/nvim-lspconfig" },
  { "sainnhe/gruvbox-material" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   build = function()
  --     pcall(vim.cmd.TSUpdate)
  --   end,
  --   config = require("config.treesitter").setup,
  -- },
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
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require("lsp_signature").setup(opts)
    end,
  },
}
