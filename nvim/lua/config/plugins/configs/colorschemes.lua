local M = {
  {
    "ellisonleao/gruvbox.nvim",
    config = true,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {
      style = "storm",
    },
    priority = 1000,
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").load()
    end,
  },
  {
    "sainnhe/gruvbox-material"
  },
}

return M
