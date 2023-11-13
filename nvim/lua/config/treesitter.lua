local M = {}

M.setup = function()
  require("nvim-treesitter.configs").setup({
    highlight = {
      enable = true,
    },
  }) 
end

return M
