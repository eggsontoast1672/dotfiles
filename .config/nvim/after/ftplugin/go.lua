-- The convention in Go is to use tabs for indentation, so we should set that
-- here.
local utils = require("config.utils")

utils.buffer_set_indentation({
  expand = false,
  width = 4,
})
