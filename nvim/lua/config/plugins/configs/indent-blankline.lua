local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "┋",
    },
    scope = {
      -- Remove the little line underneath the function definition
      enabled = false,
    },
  },
}

return M
