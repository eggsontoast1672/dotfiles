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
  vim.cmd("packadd packer.nvim")
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
	-- dracula/vim
	use({
		"dracula/vim",
		as = "dracula",
	})

	-- markid
	use("David-Kunz/markid")

	-- nvim-treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
		config = function()
			require("user.treesitter")
		end,
    run = ":TSUpdate",
  })

  -- packer.nvim
  use("wbthomason/packer.nvim")

  -- telescope.nvim
  use({
    "nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		config = function()
			require("user.telescope")
		end,
		requires = {
			"nvim-lua/plenary.nvim",
		},
  })

  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
