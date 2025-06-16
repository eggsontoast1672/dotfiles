return {
  "sainnhe/gruvbox-material",
  priority = 1000,
  init = function()
    vim.g.gruvbox_material_transparent_background = 1
  end,
  config = function()
    vim.cmd.colorscheme("gruvbox-material")
  end,
}
