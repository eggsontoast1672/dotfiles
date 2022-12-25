local function ensure_packer()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd("packadd packer.nvim")
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  -- hrsh7th
  use("hrsh7th/nvim-cmp") -- It's important that this one is installed before the rest

  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/vim-vsnip")

  -- nvim-lspconfig
  use({
    "neovim/nvim-lspconfig",
    requires = {
      "j-hui/fidget.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  })

  -- nvim-treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  -- packer.nvim
  use("wbthomason/packer.nvim")

  -- telescope.nvim
  use({
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

  -- UI Plugins
  use({
    "Shatur/neovim-ayu",
    "lukas-reineke/indent-blankline.nvim",
    "martinsione/darkplus.nvim",
    "navarasu/onedark.nvim",
    "nvim-lualine/lualine.nvim",
  })

  use("rust-lang/rust.vim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
