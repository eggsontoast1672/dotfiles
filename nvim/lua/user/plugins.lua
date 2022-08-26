local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Failed to require packer")
  return
end

packer.startup(function(use)
  -- nvim-treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("user.treesitter")
    end,
    run = ":TSUpdate",
  })

  -- onedark.nvim
  use({
    "navarasu/onedark.nvim",
    config = function()
      -- require("onedark").load()
    end,
  })

  -- packer.nvim
  use("wbthomason/packer.nvim")

  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
