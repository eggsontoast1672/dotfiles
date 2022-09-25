local markid_ok, markid = pcall(require, "markid")
if markid_ok then
	COLORS = markid.colors.bright
end

require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
  },
	markid = {
		colors = COLORS,
		enable = true,
	},
})
