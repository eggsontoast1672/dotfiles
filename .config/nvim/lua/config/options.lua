local options = {
  clipboard = "unnamedplus",
  colorcolumn = "80",
  completeopt = "menu",
  cursorline = true,
  expandtab = true,
  -- guicursor = "i:block",
  hlsearch = false,
  laststatus = 2,
  number = true,
  relativenumber = true,
  scrolloff = 5,
  shiftwidth = 4,
  showmode = false,
  signcolumn = "yes",
  smartindent = true,
  softtabstop = 4,
  splitbelow = true,
  splitright = true,
  tabstop = 4,
  termguicolors = true,
  wrap = false,
}

return {
  setup = function()
    for option, value in pairs(options) do
      vim.opt[option] = value
    end
  end,
}
