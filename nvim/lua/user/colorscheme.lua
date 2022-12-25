local colorscheme = "onedark"

local status_ok = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Failed to find colorscheme " .. colorscheme)
end

-- vim.cmd("highlight Normal ctermbg=none guibg=none")
