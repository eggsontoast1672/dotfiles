local M = {}

function M.detect_indentation()
  local cwd = vim.fn.getcwd()
  local file = io.open(cwd .. "/.clang-format", "r")
  if file == nil then
    return
  end

  local content = file:read("*all")
  for line in content:gmatch("[^\n]+") do
    -- We continue forth assuming that the iterator will have the values we want.
    -- If it doesn't, it's likely a syntax error in the .clang-format file
    -- itself, which we don't need to catch.
    local words = line:gmatch("%S+")
    local option = words()

    if option == "IndentWidth:" then
      local value = words()
      local width = tonumber(value)

      vim.opt_local.shiftwidth = width
      vim.opt_local.softtabstop = width
      vim.opt_local.tabstop = width

      break
    end
  end

  file:close()
end

return M
