local keymaps = {
  { "n", "<leader>e", vim.cmd.Explore },
  { "n", "<leader>he", ":%!xxd<cr>" },
  { "n", "<leader>hr", ":%!xxd -r<cr>" },
  { "n", "<leader>ss", "<c-w>s<cmd>terminal<cr>i" },
  { "n", "<leader>sv", "<c-w>v<cmd>terminal<cr>i" },
  { "n", "<leader>w", vim.cmd.write },
  { "t", "<esc>", "<c-\\><c-n>" },
}

return {
  setup = function()
    vim.g.mapleader = " "
    for _, keymap in pairs(keymaps) do
      vim.keymap.set(keymap[1], keymap[2], keymap[3])
    end
  end
}
