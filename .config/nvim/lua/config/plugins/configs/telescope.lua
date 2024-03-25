return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>f", "<cmd>Telescope find_files<cr>" },
    { "<leader>/", "<cmd>Telescope live_grep<cr>" },
  },
}
