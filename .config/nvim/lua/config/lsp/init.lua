local utils = require("config.lsp.utils")

local M = {}

M.setup = function()
  utils.setup_mason()
  utils.setup_keymaps()
  utils.setup_completion()
end

return M
