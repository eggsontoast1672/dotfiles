local utils = require("config.plugins.utils")

local M = {}

M.setup = function()
  -- Normally I would require all needed files at the top of the file, but in
  -- this case lazy needs to be bootstrapped before it can be required.
  utils.bootstrap_lazy()
  require("lazy").setup("config.plugins.spec")
end

return M
