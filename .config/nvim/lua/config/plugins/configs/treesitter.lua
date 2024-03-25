local M = { "nvim-treesitter/nvim-treesitter" }

M.build = function()
  pcall(vim.cmd.TSUpdate)
end

M.config = function()
  require("nvim-treesitter.configs").setup({
    highlight = {
      enable = true,
    },
  })
end

return M
