local utils = require("config.lsp.utils")

local M = {}

M.setup = function()
  utils.setup_mason()
  utils.setup_on_attach()
  utils.setup_completion()
end

return M
