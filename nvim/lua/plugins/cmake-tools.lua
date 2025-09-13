return {
  "Civitasv/cmake-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "akinsho/toggleterm.nvim",
  },
  opts = {
    cmake_build_directory = "build",
    cmake_executor = { name = "toggleterm" },
    cmake_runner = { name = "toggleterm" },
  },
  keys = {
    { "<leader>cg", "<cmd>CMakeGenerate<cr>" },
    { "<leader>cb", "<cmd>CMakeBuild<cr>" },
    { "<leader>cr", "<cmd>CMakeRun<cr>" },
  },
}
